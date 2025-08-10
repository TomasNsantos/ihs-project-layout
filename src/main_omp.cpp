#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <errno.h>
#include <omp.h>
#include <SDL2/SDL.h>

#include "ioctl_cmds.h"
#include "display.h"
#include "pong.h"

// Global game data
GameData game_data;
// Initialize SDL and create window
int init_graphics(SDL_Window** window, SDL_Renderer** renderer) {
    if (SDL_Init(SDL_INIT_VIDEO) < 0) {
        printf("SDL init failed: %s\n", SDL_GetError());
        return -1;
    }
    
    *window = SDL_CreateWindow("FPGA Pong", 
                              SDL_WINDOWPOS_CENTERED, 
                              SDL_WINDOWPOS_CENTERED,
                              WINDOW_WIDTH, WINDOW_HEIGHT, 
                              SDL_WINDOW_SHOWN);
    if (!*window) {
        printf("Window creation failed: %s\n", SDL_GetError());
        return -1;
    }
    
    *renderer = SDL_CreateRenderer(*window, -1, SDL_RENDERER_ACCELERATED);
    if (!*renderer) {
        printf("Renderer creation failed: %s\n", SDL_GetError());
        return -1;
    }
    
    return 0;
}

// Inicializa os objetos do jogo
void init_game(GameData* game) {
    
    game->state = GAME_MENU;
    game->running = 1;
    
    // Inicializa a bola no centro
    game->ball.x = WINDOW_WIDTH / 2;
    game->ball.y = WINDOW_HEIGHT / 2;
    game->ball.vel_x = BALL_SPEED;
    game->ball.vel_y = BALL_SPEED;
    
    // Inicializa as raquetes
    game->player1.x = 50;
    game->player1.y = WINDOW_HEIGHT / 2 - PADDLE_HEIGHT / 2;
    game->player1.score = 0;
    
    game->player2.x = WINDOW_WIDTH - 50 - PADDLE_WIDTH;
    game->player2.y = WINDOW_HEIGHT / 2 - PADDLE_HEIGHT / 2;
    game->player2.score = 0;
}

// Atualiza a logica do jogo
void update_game(GameData* game) {
    // Usa uma secao critica do OpenMP para proteger o acesso aos dados do jogo
    #pragma omp critical (game_data_access)
    {
        if (game->state != GAME_PLAYING) {
            return; // Sai da secao critica
        }
        
        // Atualiza a posicao da bola
        game->ball.x += game->ball.vel_x;
        game->ball.y += game->ball.vel_y;
        
        // Colisao da bola com as paredes superior/inferior
        if (game->ball.y <= 0 || game->ball.y >= WINDOW_HEIGHT - BALL_SIZE) {
            game->ball.vel_y = -game->ball.vel_y;
        }
        
        // Colisao da bola com as raquetes
        SDL_Rect ball_rect = {(int)game->ball.x, (int)game->ball.y, BALL_SIZE, BALL_SIZE};
        SDL_Rect p1_rect = {(int)game->player1.x, (int)game->player1.y, PADDLE_WIDTH, PADDLE_HEIGHT};
        SDL_Rect p2_rect = {(int)game->player2.x, (int)game->player2.y, PADDLE_WIDTH, PADDLE_HEIGHT};
        
        if (SDL_HasIntersection(&ball_rect, &p1_rect) || 
            SDL_HasIntersection(&ball_rect, &p2_rect)) {
            game->ball.vel_x = -game->ball.vel_x;
        }
        
        // Deteccao de pontuacao
        if (game->ball.x < 0) {
            game->player2.score++;
            game->ball.x = WINDOW_WIDTH / 2;
            game->ball.y = WINDOW_HEIGHT / 2;
            game->ball.vel_x = BALL_SPEED;
        }
        
        if (game->ball.x > WINDOW_WIDTH) {
            game->player1.score++;
            game->ball.x = WINDOW_WIDTH / 2;
            game->ball.y = WINDOW_HEIGHT / 2;
            game->ball.vel_x = -BALL_SPEED;
        }
        
        // Verifica se ha um vencedor
        if (game->player1.score >= 5 || game->player2.score >= 5) {
            game->state = GAME_OVER;
            game->winner = (game->player1.score >= 5) ? 1 : 2;
        }
    } // Fim da secao critica
}

// Lida com a entrada do teclado
void handle_input(GameData* game, const Uint8* keystate) {
    #pragma omp critical (game_data_access)
    {
        // Controles do Jogador 1 (W/S)
        if (keystate[SDL_SCANCODE_W] && game->player1.y > 0) {
            game->player1.y -= PADDLE_SPEED;
        }
        if (keystate[SDL_SCANCODE_S] && game->player1.y < WINDOW_HEIGHT - PADDLE_HEIGHT) {
            game->player1.y += PADDLE_SPEED;
        }
        
        // Controles do Jogador 2 (Setas)
        if (keystate[SDL_SCANCODE_UP] && game->player2.y > 0) {
            game->player2.y -= PADDLE_SPEED;
        }
        if (keystate[SDL_SCANCODE_DOWN] && game->player2.y < WINDOW_HEIGHT - PADDLE_HEIGHT) {
            game->player2.y += PADDLE_SPEED;
        }
        
        // Controles de estado do jogo
        if (keystate[SDL_SCANCODE_SPACE]) {
            if (game->state == GAME_MENU) {
                game->state = GAME_PLAYING;
            } else if (game->state == GAME_PLAYING) {
                game->state = GAME_PAUSED;
            } else if (game->state == GAME_PAUSED) {
                game->state = GAME_PLAYING;
            }
        }
        
        if (keystate[SDL_SCANCODE_R] && game->state == GAME_OVER) {
            init_game(game); // Reinicializa o jogo
        }
    } // Fim da secao critica

    // Renderiza o jogo
void render_game(SDL_Renderer* renderer, GameData* game) {
    // Limpa a tela
    SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
    SDL_RenderClear(renderer);
    
    #pragma omp critical (game_data_access)
    {
        // Desenha objetos em branco
        SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);
        
        // Desenha as raquetes
        SDL_Rect p1_rect = {(int)game->player1.x, (int)game->player1.y, PADDLE_WIDTH, PADDLE_HEIGHT};
        SDL_Rect p2_rect = {(int)game->player2.x, (int)game->player2.y, PADDLE_WIDTH, PADDLE_HEIGHT};
        SDL_RenderFillRect(renderer, &p1_rect);
        SDL_RenderFillRect(renderer, &p2_rect);
        
        // Desenha a bola
        SDL_Rect ball_rect = {(int)game->ball.x, (int)game->ball.y, BALL_SIZE, BALL_SIZE};
        SDL_RenderFillRect(renderer, &ball_rect);
        
        // Desenha a linha central
        for (int y = 0; y < WINDOW_HEIGHT; y += 20) {
            SDL_Rect line_rect = {WINDOW_WIDTH/2 - 2, y, 4, 10};
            SDL_RenderFillRect(renderer, &line_rect);
        }
    } // Fim da seção crítica
    
    // Apresenta o renderizador
    SDL_RenderPresent(renderer);
}
}


int main_Omp() {
    SDL_Window* window = NULL;
    SDL_Renderer* renderer = NULL;
    SDL_Event event;
    
    printf("FPGA Pong Game Starting...\n");
    
    init_game(&game_data);
    
    if (init_hardware(&game_data) < 0) {
        printf("Warning: Hardware initialization failed, continuing without FPGA features\n");
    }
    
    if (init_graphics(&window, &renderer) < 0) {
        return -1;
    }
    
    printf("Game initialized. Press SPACE to start, W/S and UP/DOWN to control paddles\n");
    
    // Usa secoes paralelas do OpenMP para executar o loop do jogo e o thread de hardware
    #pragma omp parallel sections
    {
        // Seção 1: Loop Principal do Jogo (Gráficos, Logica, Entrada)
        #pragma omp section
        {
            int local_running = 1;
            while (local_running) {
                // Lida com eventos
                while (SDL_PollEvent(&event)) {
                    if (event.type == SDL_QUIT) {
                        // Define 'running' como 0 dentro de uma secoo critica
                        // para sinalizar que o outro thread deve parar
                        #pragma omp critical (game_data_access)
                        {
                            game_data.running = 0;
                        }
                    }
                }
                
                // Lida com entrada de teclado contínua
                const Uint8* keystate = SDL_GetKeyboardState(NULL);
                handle_input(&game_data, keystate);
                
                // Atualiza a logica do jogo
                update_game(&game_data);
                
                // Renderiza
                render_game(renderer, &game_data);
                
                // Verifica a flag 'running' localmente apos a seção critica
                #pragma omp critical (game_data_access)
                {
                    local_running = game_data.running;
                }

                // Controla a taxa de quadros
                SDL_Delay(16); // ~60 FPS
            }
            printf("Loop principal do jogo terminando.\n");
        }
        
        // Seção 2: Thread de Hardware
        #pragma omp section
        {
            hardware_thread(&game_data);
        }
    } // Fim da regiao paralela, o programa esperara aqui ate que ambas as secoes terminem

    // Limpeza
    cleanup_hardware(&game_data);
    
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    // Destrói o bloqueio do OpenMP
    omp_destroy_lock(&game_data.lock);
    
    printf("Jogo finalizado.\n");
    return 0;
}