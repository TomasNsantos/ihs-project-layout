// pcihellocore.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module pcihellocore (
		output wire [31:0] hexport_external_connection_export,     //    hexport_external_connection.export
		input  wire [15:0] inport_external_connection_export,      //     inport_external_connection.export
		input  wire        pcie_hard_ip_0_pcie_rstn_export,        //       pcie_hard_ip_0_pcie_rstn.export
		input  wire        pcie_hard_ip_0_powerdown_pll_powerdown, //       pcie_hard_ip_0_powerdown.pll_powerdown
		input  wire        pcie_hard_ip_0_powerdown_gxb_powerdown, //                               .gxb_powerdown
		input  wire        pcie_hard_ip_0_refclk_export,           //          pcie_hard_ip_0_refclk.export
		input  wire        pcie_hard_ip_0_rx_in_rx_datain_0,       //           pcie_hard_ip_0_rx_in.rx_datain_0
		output wire        pcie_hard_ip_0_tx_out_tx_dataout_0,     //          pcie_hard_ip_0_tx_out.tx_dataout_0
		output wire [31:0] seg_digits_external_connection_export   // seg_digits_external_connection.export
	);

	wire         pcie_hard_ip_0_pcie_core_clk_clk;                   // pcie_hard_ip_0:pcie_core_clk_clk -> [hexport:clk, inport:clk, irq_mapper:clk, mm_interconnect_0:pcie_hard_ip_0_pcie_core_clk_clk, pcie_hard_ip_0:cal_blk_clk_clk, pcie_hard_ip_0:fixedclk_clk, pcie_hard_ip_0:reconfig_gxbclk_clk, rst_controller:clk, seg_digits:clk]
	wire         pcie_hard_ip_0_bar0_waitrequest;                    // mm_interconnect_0:pcie_hard_ip_0_bar0_waitrequest -> pcie_hard_ip_0:bar0_waitrequest
	wire  [63:0] pcie_hard_ip_0_bar0_readdata;                       // mm_interconnect_0:pcie_hard_ip_0_bar0_readdata -> pcie_hard_ip_0:bar0_readdata
	wire  [31:0] pcie_hard_ip_0_bar0_address;                        // pcie_hard_ip_0:bar0_address -> mm_interconnect_0:pcie_hard_ip_0_bar0_address
	wire         pcie_hard_ip_0_bar0_read;                           // pcie_hard_ip_0:bar0_read -> mm_interconnect_0:pcie_hard_ip_0_bar0_read
	wire   [7:0] pcie_hard_ip_0_bar0_byteenable;                     // pcie_hard_ip_0:bar0_byteenable -> mm_interconnect_0:pcie_hard_ip_0_bar0_byteenable
	wire         pcie_hard_ip_0_bar0_readdatavalid;                  // mm_interconnect_0:pcie_hard_ip_0_bar0_readdatavalid -> pcie_hard_ip_0:bar0_readdatavalid
	wire         pcie_hard_ip_0_bar0_write;                          // pcie_hard_ip_0:bar0_write -> mm_interconnect_0:pcie_hard_ip_0_bar0_write
	wire  [63:0] pcie_hard_ip_0_bar0_writedata;                      // pcie_hard_ip_0:bar0_writedata -> mm_interconnect_0:pcie_hard_ip_0_bar0_writedata
	wire   [6:0] pcie_hard_ip_0_bar0_burstcount;                     // pcie_hard_ip_0:bar0_burstcount -> mm_interconnect_0:pcie_hard_ip_0_bar0_burstcount
	wire         mm_interconnect_0_pcie_hard_ip_0_cra_chipselect;    // mm_interconnect_0:pcie_hard_ip_0_cra_chipselect -> pcie_hard_ip_0:cra_chipselect
	wire  [31:0] mm_interconnect_0_pcie_hard_ip_0_cra_readdata;      // pcie_hard_ip_0:cra_readdata -> mm_interconnect_0:pcie_hard_ip_0_cra_readdata
	wire         mm_interconnect_0_pcie_hard_ip_0_cra_waitrequest;   // pcie_hard_ip_0:cra_waitrequest -> mm_interconnect_0:pcie_hard_ip_0_cra_waitrequest
	wire  [11:0] mm_interconnect_0_pcie_hard_ip_0_cra_address;       // mm_interconnect_0:pcie_hard_ip_0_cra_address -> pcie_hard_ip_0:cra_address
	wire         mm_interconnect_0_pcie_hard_ip_0_cra_read;          // mm_interconnect_0:pcie_hard_ip_0_cra_read -> pcie_hard_ip_0:cra_read
	wire   [3:0] mm_interconnect_0_pcie_hard_ip_0_cra_byteenable;    // mm_interconnect_0:pcie_hard_ip_0_cra_byteenable -> pcie_hard_ip_0:cra_byteenable
	wire         mm_interconnect_0_pcie_hard_ip_0_cra_write;         // mm_interconnect_0:pcie_hard_ip_0_cra_write -> pcie_hard_ip_0:cra_write
	wire  [31:0] mm_interconnect_0_pcie_hard_ip_0_cra_writedata;     // mm_interconnect_0:pcie_hard_ip_0_cra_writedata -> pcie_hard_ip_0:cra_writedata
	wire  [31:0] mm_interconnect_0_inport_s1_readdata;               // inport:readdata -> mm_interconnect_0:inport_s1_readdata
	wire   [1:0] mm_interconnect_0_inport_s1_address;                // mm_interconnect_0:inport_s1_address -> inport:address
	wire         mm_interconnect_0_hexport_s1_chipselect;            // mm_interconnect_0:hexport_s1_chipselect -> hexport:chipselect
	wire  [31:0] mm_interconnect_0_hexport_s1_readdata;              // hexport:readdata -> mm_interconnect_0:hexport_s1_readdata
	wire   [1:0] mm_interconnect_0_hexport_s1_address;               // mm_interconnect_0:hexport_s1_address -> hexport:address
	wire         mm_interconnect_0_hexport_s1_write;                 // mm_interconnect_0:hexport_s1_write -> hexport:write_n
	wire  [31:0] mm_interconnect_0_hexport_s1_writedata;             // mm_interconnect_0:hexport_s1_writedata -> hexport:writedata
	wire         mm_interconnect_0_seg_digits_s1_chipselect;         // mm_interconnect_0:seg_digits_s1_chipselect -> seg_digits:chipselect
	wire  [31:0] mm_interconnect_0_seg_digits_s1_readdata;           // seg_digits:readdata -> mm_interconnect_0:seg_digits_s1_readdata
	wire   [1:0] mm_interconnect_0_seg_digits_s1_address;            // mm_interconnect_0:seg_digits_s1_address -> seg_digits:address
	wire         mm_interconnect_0_seg_digits_s1_write;              // mm_interconnect_0:seg_digits_s1_write -> seg_digits:write_n
	wire  [31:0] mm_interconnect_0_seg_digits_s1_writedata;          // mm_interconnect_0:seg_digits_s1_writedata -> seg_digits:writedata
	wire         mm_interconnect_0_pcie_hard_ip_0_txs_chipselect;    // mm_interconnect_0:pcie_hard_ip_0_txs_chipselect -> pcie_hard_ip_0:txs_chipselect
	wire  [63:0] mm_interconnect_0_pcie_hard_ip_0_txs_readdata;      // pcie_hard_ip_0:txs_readdata -> mm_interconnect_0:pcie_hard_ip_0_txs_readdata
	wire         mm_interconnect_0_pcie_hard_ip_0_txs_waitrequest;   // pcie_hard_ip_0:txs_waitrequest -> mm_interconnect_0:pcie_hard_ip_0_txs_waitrequest
	wire  [14:0] mm_interconnect_0_pcie_hard_ip_0_txs_address;       // mm_interconnect_0:pcie_hard_ip_0_txs_address -> pcie_hard_ip_0:txs_address
	wire         mm_interconnect_0_pcie_hard_ip_0_txs_read;          // mm_interconnect_0:pcie_hard_ip_0_txs_read -> pcie_hard_ip_0:txs_read
	wire   [7:0] mm_interconnect_0_pcie_hard_ip_0_txs_byteenable;    // mm_interconnect_0:pcie_hard_ip_0_txs_byteenable -> pcie_hard_ip_0:txs_byteenable
	wire         mm_interconnect_0_pcie_hard_ip_0_txs_readdatavalid; // pcie_hard_ip_0:txs_readdatavalid -> mm_interconnect_0:pcie_hard_ip_0_txs_readdatavalid
	wire         mm_interconnect_0_pcie_hard_ip_0_txs_write;         // mm_interconnect_0:pcie_hard_ip_0_txs_write -> pcie_hard_ip_0:txs_write
	wire  [63:0] mm_interconnect_0_pcie_hard_ip_0_txs_writedata;     // mm_interconnect_0:pcie_hard_ip_0_txs_writedata -> pcie_hard_ip_0:txs_writedata
	wire   [6:0] mm_interconnect_0_pcie_hard_ip_0_txs_burstcount;    // mm_interconnect_0:pcie_hard_ip_0_txs_burstcount -> pcie_hard_ip_0:txs_burstcount
	wire  [15:0] pcie_hard_ip_0_rxm_irq_irq;                         // irq_mapper:sender_irq -> pcie_hard_ip_0:rxm_irq_irq
	wire         rst_controller_reset_out_reset;                     // rst_controller:reset_out -> [hexport:reset_n, inport:reset_n, irq_mapper:reset, mm_interconnect_0:inport_reset_reset_bridge_in_reset_reset, seg_digits:reset_n]
	wire         pcie_hard_ip_0_pcie_core_reset_reset;               // pcie_hard_ip_0:pcie_core_reset_reset_n -> rst_controller:reset_in0

	pcihellocore_hexport hexport (
		.clk        (pcie_hard_ip_0_pcie_core_clk_clk),        //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),         //               reset.reset_n
		.address    (mm_interconnect_0_hexport_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hexport_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hexport_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hexport_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hexport_s1_readdata),   //                    .readdata
		.out_port   (hexport_external_connection_export)       // external_connection.export
	);

	pcihellocore_inport inport (
		.clk      (pcie_hard_ip_0_pcie_core_clk_clk),     //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address  (mm_interconnect_0_inport_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_inport_s1_readdata), //                    .readdata
		.in_port  (inport_external_connection_export)     // external_connection.export
	);

	pcihellocore_pcie_hard_ip_0 #(
		.p_pcie_hip_type                     ("2"),
		.lane_mask                           (8'b11111110),
		.max_link_width                      (1),
		.millisecond_cycle_count             ("125000"),
		.enable_gen2_core                    ("false"),
		.gen2_lane_rate_mode                 ("false"),
		.no_soft_reset                       ("false"),
		.core_clk_divider                    (4),
		.enable_ch0_pclk_out                 ("true"),
		.core_clk_source                     ("pclk"),
		.CB_P2A_AVALON_ADDR_B0               (0),
		.bar0_size_mask                      (16),
		.bar0_io_space                       ("false"),
		.bar0_64bit_mem_space                ("false"),
		.bar0_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B1               (0),
		.bar1_size_mask                      (0),
		.bar1_io_space                       ("false"),
		.bar1_64bit_mem_space                ("false"),
		.bar1_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B2               (0),
		.bar2_size_mask                      (0),
		.bar2_io_space                       ("false"),
		.bar2_64bit_mem_space                ("false"),
		.bar2_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B3               (0),
		.bar3_size_mask                      (0),
		.bar3_io_space                       ("false"),
		.bar3_64bit_mem_space                ("false"),
		.bar3_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B4               (0),
		.bar4_size_mask                      (0),
		.bar4_io_space                       ("false"),
		.bar4_64bit_mem_space                ("false"),
		.bar4_prefetchable                   ("false"),
		.CB_P2A_AVALON_ADDR_B5               (0),
		.bar5_size_mask                      (0),
		.bar5_io_space                       ("false"),
		.bar5_64bit_mem_space                ("false"),
		.bar5_prefetchable                   ("false"),
		.vendor_id                           (4466),
		.device_id                           (4),
		.revision_id                         (1),
		.class_code                          (0),
		.subsystem_vendor_id                 (4466),
		.subsystem_device_id                 (4),
		.port_link_number                    (1),
		.msi_function_count                  (0),
		.enable_msi_64bit_addressing         ("true"),
		.enable_function_msix_support        ("false"),
		.eie_before_nfts_count               (4),
		.enable_completion_timeout_disable   ("false"),
		.completion_timeout                  ("NONE"),
		.enable_adapter_half_rate_mode       ("false"),
		.msix_pba_bir                        (0),
		.msix_pba_offset                     (0),
		.msix_table_bir                      (0),
		.msix_table_offset                   (0),
		.msix_table_size                     (0),
		.use_crc_forwarding                  ("false"),
		.surprise_down_error_support         ("false"),
		.dll_active_report_support           ("false"),
		.bar_io_window_size                  ("32BIT"),
		.bar_prefetchable                    (32),
		.hot_plug_support                    (7'b0000000),
		.no_command_completed                ("true"),
		.slot_power_limit                    (0),
		.slot_power_scale                    (0),
		.slot_number                         (0),
		.enable_slot_register                ("false"),
		.advanced_errors                     ("false"),
		.enable_ecrc_check                   ("false"),
		.enable_ecrc_gen                     ("false"),
		.max_payload_size                    (0),
		.retry_buffer_last_active_address    (255),
		.credit_buffer_allocation_aux        ("ABSOLUTE"),
		.vc0_rx_flow_ctrl_posted_header      (28),
		.vc0_rx_flow_ctrl_posted_data        (198),
		.vc0_rx_flow_ctrl_nonposted_header   (30),
		.vc0_rx_flow_ctrl_nonposted_data     (0),
		.vc0_rx_flow_ctrl_compl_header       (48),
		.vc0_rx_flow_ctrl_compl_data         (256),
		.RX_BUF                              (9),
		.RH_NUM                              (7),
		.G_TAG_NUM0                          (32),
		.endpoint_l0_latency                 (0),
		.endpoint_l1_latency                 (0),
		.enable_l1_aspm                      ("false"),
		.l01_entry_latency                   (31),
		.diffclock_nfts_count                (255),
		.sameclock_nfts_count                (255),
		.l1_exit_latency_sameclock           (7),
		.l1_exit_latency_diffclock           (7),
		.l0_exit_latency_sameclock           (7),
		.l0_exit_latency_diffclock           (7),
		.gen2_diffclock_nfts_count           (255),
		.gen2_sameclock_nfts_count           (255),
		.CG_COMMON_CLOCK_MODE                (1),
		.CB_PCIE_MODE                        (0),
		.AST_LITE                            (0),
		.CB_PCIE_RX_LITE                     (0),
		.CG_RXM_IRQ_NUM                      (16),
		.CG_AVALON_S_ADDR_WIDTH              (20),
		.bypass_tl                           ("false"),
		.CG_IMPL_CRA_AV_SLAVE_PORT           (1),
		.CG_NO_CPL_REORDERING                (0),
		.CG_ENABLE_A2P_INTERRUPT             (0),
		.p_user_msi_enable                   (0),
		.CG_IRQ_BIT_ENA                      (65535),
		.CB_A2P_ADDR_MAP_IS_FIXED            (1),
		.CB_A2P_ADDR_MAP_NUM_ENTRIES         (1),
		.CB_A2P_ADDR_MAP_PASS_THRU_BITS      (15),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_0_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_0_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_1_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_1_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_2_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_2_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_3_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_3_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_4_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_4_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_5_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_5_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_6_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_6_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_7_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_7_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_8_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_8_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_9_HIGH  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_9_LOW   (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_10_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_10_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_11_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_11_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_12_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_12_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_13_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_13_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_14_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_14_LOW  (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_15_HIGH (32'b00000000000000000000000000000000),
		.CB_A2P_ADDR_MAP_FIXED_TABLE_15_LOW  (32'b00000000000000000000000000000000),
		.RXM_DATA_WIDTH                      (64),
		.RXM_BEN_WIDTH                       (8),
		.TL_SELECTION                        (1),
		.pcie_mode                           ("SHARED_MODE"),
		.single_rx_detect                    (1),
		.enable_coreclk_out_half_rate        ("false"),
		.low_priority_vc                     (0),
		.link_width                          (1),
		.cyclone4                            (1)
	) pcie_hard_ip_0 (
		.pcie_core_clk_clk                  (pcie_hard_ip_0_pcie_core_clk_clk),                   //      pcie_core_clk.clk
		.pcie_core_reset_reset_n            (pcie_hard_ip_0_pcie_core_reset_reset),               //    pcie_core_reset.reset_n
		.cal_blk_clk_clk                    (pcie_hard_ip_0_pcie_core_clk_clk),                   //        cal_blk_clk.clk
		.txs_address                        (mm_interconnect_0_pcie_hard_ip_0_txs_address),       //                txs.address
		.txs_chipselect                     (mm_interconnect_0_pcie_hard_ip_0_txs_chipselect),    //                   .chipselect
		.txs_byteenable                     (mm_interconnect_0_pcie_hard_ip_0_txs_byteenable),    //                   .byteenable
		.txs_readdata                       (mm_interconnect_0_pcie_hard_ip_0_txs_readdata),      //                   .readdata
		.txs_writedata                      (mm_interconnect_0_pcie_hard_ip_0_txs_writedata),     //                   .writedata
		.txs_read                           (mm_interconnect_0_pcie_hard_ip_0_txs_read),          //                   .read
		.txs_write                          (mm_interconnect_0_pcie_hard_ip_0_txs_write),         //                   .write
		.txs_burstcount                     (mm_interconnect_0_pcie_hard_ip_0_txs_burstcount),    //                   .burstcount
		.txs_readdatavalid                  (mm_interconnect_0_pcie_hard_ip_0_txs_readdatavalid), //                   .readdatavalid
		.txs_waitrequest                    (mm_interconnect_0_pcie_hard_ip_0_txs_waitrequest),   //                   .waitrequest
		.refclk_export                      (pcie_hard_ip_0_refclk_export),                       //             refclk.export
		.test_in_test_in                    (),                                                   //            test_in.test_in
		.pcie_rstn_export                   (pcie_hard_ip_0_pcie_rstn_export),                    //          pcie_rstn.export
		.clocks_sim_clk250_export           (),                                                   //         clocks_sim.clk250_export
		.clocks_sim_clk500_export           (),                                                   //                   .clk500_export
		.clocks_sim_clk125_export           (),                                                   //                   .clk125_export
		.reconfig_busy_busy_altgxb_reconfig (),                                                   //      reconfig_busy.busy_altgxb_reconfig
		.pipe_ext_pipe_mode                 (),                                                   //           pipe_ext.pipe_mode
		.pipe_ext_phystatus_ext             (),                                                   //                   .phystatus_ext
		.pipe_ext_rate_ext                  (),                                                   //                   .rate_ext
		.pipe_ext_powerdown_ext             (),                                                   //                   .powerdown_ext
		.pipe_ext_txdetectrx_ext            (),                                                   //                   .txdetectrx_ext
		.pipe_ext_rxelecidle0_ext           (),                                                   //                   .rxelecidle0_ext
		.pipe_ext_rxdata0_ext               (),                                                   //                   .rxdata0_ext
		.pipe_ext_rxstatus0_ext             (),                                                   //                   .rxstatus0_ext
		.pipe_ext_rxvalid0_ext              (),                                                   //                   .rxvalid0_ext
		.pipe_ext_rxdatak0_ext              (),                                                   //                   .rxdatak0_ext
		.pipe_ext_txdata0_ext               (),                                                   //                   .txdata0_ext
		.pipe_ext_txdatak0_ext              (),                                                   //                   .txdatak0_ext
		.pipe_ext_rxpolarity0_ext           (),                                                   //                   .rxpolarity0_ext
		.pipe_ext_txcompl0_ext              (),                                                   //                   .txcompl0_ext
		.pipe_ext_txelecidle0_ext           (),                                                   //                   .txelecidle0_ext
		.powerdown_pll_powerdown            (pcie_hard_ip_0_powerdown_pll_powerdown),             //          powerdown.pll_powerdown
		.powerdown_gxb_powerdown            (pcie_hard_ip_0_powerdown_gxb_powerdown),             //                   .gxb_powerdown
		.bar0_address                       (pcie_hard_ip_0_bar0_address),                        //               bar0.address
		.bar0_read                          (pcie_hard_ip_0_bar0_read),                           //                   .read
		.bar0_waitrequest                   (pcie_hard_ip_0_bar0_waitrequest),                    //                   .waitrequest
		.bar0_write                         (pcie_hard_ip_0_bar0_write),                          //                   .write
		.bar0_readdatavalid                 (pcie_hard_ip_0_bar0_readdatavalid),                  //                   .readdatavalid
		.bar0_readdata                      (pcie_hard_ip_0_bar0_readdata),                       //                   .readdata
		.bar0_writedata                     (pcie_hard_ip_0_bar0_writedata),                      //                   .writedata
		.bar0_burstcount                    (pcie_hard_ip_0_bar0_burstcount),                     //                   .burstcount
		.bar0_byteenable                    (pcie_hard_ip_0_bar0_byteenable),                     //                   .byteenable
		.cra_chipselect                     (mm_interconnect_0_pcie_hard_ip_0_cra_chipselect),    //                cra.chipselect
		.cra_address                        (mm_interconnect_0_pcie_hard_ip_0_cra_address),       //                   .address
		.cra_byteenable                     (mm_interconnect_0_pcie_hard_ip_0_cra_byteenable),    //                   .byteenable
		.cra_read                           (mm_interconnect_0_pcie_hard_ip_0_cra_read),          //                   .read
		.cra_readdata                       (mm_interconnect_0_pcie_hard_ip_0_cra_readdata),      //                   .readdata
		.cra_write                          (mm_interconnect_0_pcie_hard_ip_0_cra_write),         //                   .write
		.cra_writedata                      (mm_interconnect_0_pcie_hard_ip_0_cra_writedata),     //                   .writedata
		.cra_waitrequest                    (mm_interconnect_0_pcie_hard_ip_0_cra_waitrequest),   //                   .waitrequest
		.cra_irq_irq                        (),                                                   //            cra_irq.irq
		.rxm_irq_irq                        (pcie_hard_ip_0_rxm_irq_irq),                         //            rxm_irq.irq
		.rx_in_rx_datain_0                  (pcie_hard_ip_0_rx_in_rx_datain_0),                   //              rx_in.rx_datain_0
		.tx_out_tx_dataout_0                (pcie_hard_ip_0_tx_out_tx_dataout_0),                 //             tx_out.tx_dataout_0
		.reconfig_togxb_data                (),                                                   //     reconfig_togxb.data
		.reconfig_gxbclk_clk                (pcie_hard_ip_0_pcie_core_clk_clk),                   //    reconfig_gxbclk.clk
		.reconfig_fromgxb_0_data            (),                                                   // reconfig_fromgxb_0.data
		.fixedclk_clk                       (pcie_hard_ip_0_pcie_core_clk_clk)                    //           fixedclk.clk
	);

	pcihellocore_seg_digits seg_digits (
		.clk        (pcie_hard_ip_0_pcie_core_clk_clk),           //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),            //               reset.reset_n
		.address    (mm_interconnect_0_seg_digits_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_seg_digits_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_seg_digits_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_seg_digits_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_seg_digits_s1_readdata),   //                    .readdata
		.out_port   (seg_digits_external_connection_export)       // external_connection.export
	);

	pcihellocore_mm_interconnect_0 mm_interconnect_0 (
		.pcie_hard_ip_0_pcie_core_clk_clk         (pcie_hard_ip_0_pcie_core_clk_clk),                   //       pcie_hard_ip_0_pcie_core_clk.clk
		.inport_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                     // inport_reset_reset_bridge_in_reset.reset
		.pcie_hard_ip_0_bar0_address              (pcie_hard_ip_0_bar0_address),                        //                pcie_hard_ip_0_bar0.address
		.pcie_hard_ip_0_bar0_waitrequest          (pcie_hard_ip_0_bar0_waitrequest),                    //                                   .waitrequest
		.pcie_hard_ip_0_bar0_burstcount           (pcie_hard_ip_0_bar0_burstcount),                     //                                   .burstcount
		.pcie_hard_ip_0_bar0_byteenable           (pcie_hard_ip_0_bar0_byteenable),                     //                                   .byteenable
		.pcie_hard_ip_0_bar0_read                 (pcie_hard_ip_0_bar0_read),                           //                                   .read
		.pcie_hard_ip_0_bar0_readdata             (pcie_hard_ip_0_bar0_readdata),                       //                                   .readdata
		.pcie_hard_ip_0_bar0_readdatavalid        (pcie_hard_ip_0_bar0_readdatavalid),                  //                                   .readdatavalid
		.pcie_hard_ip_0_bar0_write                (pcie_hard_ip_0_bar0_write),                          //                                   .write
		.pcie_hard_ip_0_bar0_writedata            (pcie_hard_ip_0_bar0_writedata),                      //                                   .writedata
		.hexport_s1_address                       (mm_interconnect_0_hexport_s1_address),               //                         hexport_s1.address
		.hexport_s1_write                         (mm_interconnect_0_hexport_s1_write),                 //                                   .write
		.hexport_s1_readdata                      (mm_interconnect_0_hexport_s1_readdata),              //                                   .readdata
		.hexport_s1_writedata                     (mm_interconnect_0_hexport_s1_writedata),             //                                   .writedata
		.hexport_s1_chipselect                    (mm_interconnect_0_hexport_s1_chipselect),            //                                   .chipselect
		.inport_s1_address                        (mm_interconnect_0_inport_s1_address),                //                          inport_s1.address
		.inport_s1_readdata                       (mm_interconnect_0_inport_s1_readdata),               //                                   .readdata
		.pcie_hard_ip_0_cra_address               (mm_interconnect_0_pcie_hard_ip_0_cra_address),       //                 pcie_hard_ip_0_cra.address
		.pcie_hard_ip_0_cra_write                 (mm_interconnect_0_pcie_hard_ip_0_cra_write),         //                                   .write
		.pcie_hard_ip_0_cra_read                  (mm_interconnect_0_pcie_hard_ip_0_cra_read),          //                                   .read
		.pcie_hard_ip_0_cra_readdata              (mm_interconnect_0_pcie_hard_ip_0_cra_readdata),      //                                   .readdata
		.pcie_hard_ip_0_cra_writedata             (mm_interconnect_0_pcie_hard_ip_0_cra_writedata),     //                                   .writedata
		.pcie_hard_ip_0_cra_byteenable            (mm_interconnect_0_pcie_hard_ip_0_cra_byteenable),    //                                   .byteenable
		.pcie_hard_ip_0_cra_waitrequest           (mm_interconnect_0_pcie_hard_ip_0_cra_waitrequest),   //                                   .waitrequest
		.pcie_hard_ip_0_cra_chipselect            (mm_interconnect_0_pcie_hard_ip_0_cra_chipselect),    //                                   .chipselect
		.pcie_hard_ip_0_txs_address               (mm_interconnect_0_pcie_hard_ip_0_txs_address),       //                 pcie_hard_ip_0_txs.address
		.pcie_hard_ip_0_txs_write                 (mm_interconnect_0_pcie_hard_ip_0_txs_write),         //                                   .write
		.pcie_hard_ip_0_txs_read                  (mm_interconnect_0_pcie_hard_ip_0_txs_read),          //                                   .read
		.pcie_hard_ip_0_txs_readdata              (mm_interconnect_0_pcie_hard_ip_0_txs_readdata),      //                                   .readdata
		.pcie_hard_ip_0_txs_writedata             (mm_interconnect_0_pcie_hard_ip_0_txs_writedata),     //                                   .writedata
		.pcie_hard_ip_0_txs_burstcount            (mm_interconnect_0_pcie_hard_ip_0_txs_burstcount),    //                                   .burstcount
		.pcie_hard_ip_0_txs_byteenable            (mm_interconnect_0_pcie_hard_ip_0_txs_byteenable),    //                                   .byteenable
		.pcie_hard_ip_0_txs_readdatavalid         (mm_interconnect_0_pcie_hard_ip_0_txs_readdatavalid), //                                   .readdatavalid
		.pcie_hard_ip_0_txs_waitrequest           (mm_interconnect_0_pcie_hard_ip_0_txs_waitrequest),   //                                   .waitrequest
		.pcie_hard_ip_0_txs_chipselect            (mm_interconnect_0_pcie_hard_ip_0_txs_chipselect),    //                                   .chipselect
		.seg_digits_s1_address                    (mm_interconnect_0_seg_digits_s1_address),            //                      seg_digits_s1.address
		.seg_digits_s1_write                      (mm_interconnect_0_seg_digits_s1_write),              //                                   .write
		.seg_digits_s1_readdata                   (mm_interconnect_0_seg_digits_s1_readdata),           //                                   .readdata
		.seg_digits_s1_writedata                  (mm_interconnect_0_seg_digits_s1_writedata),          //                                   .writedata
		.seg_digits_s1_chipselect                 (mm_interconnect_0_seg_digits_s1_chipselect)          //                                   .chipselect
	);

	pcihellocore_irq_mapper irq_mapper (
		.clk        (pcie_hard_ip_0_pcie_core_clk_clk), //       clk.clk
		.reset      (rst_controller_reset_out_reset),   // clk_reset.reset
		.sender_irq (pcie_hard_ip_0_rxm_irq_irq)        //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~pcie_hard_ip_0_pcie_core_reset_reset), // reset_in0.reset
		.clk            (pcie_hard_ip_0_pcie_core_clk_clk),      //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),        // reset_out.reset
		.reset_req      (),                                      // (terminated)
		.reset_req_in0  (1'b0),                                  // (terminated)
		.reset_in1      (1'b0),                                  // (terminated)
		.reset_req_in1  (1'b0),                                  // (terminated)
		.reset_in2      (1'b0),                                  // (terminated)
		.reset_req_in2  (1'b0),                                  // (terminated)
		.reset_in3      (1'b0),                                  // (terminated)
		.reset_req_in3  (1'b0),                                  // (terminated)
		.reset_in4      (1'b0),                                  // (terminated)
		.reset_req_in4  (1'b0),                                  // (terminated)
		.reset_in5      (1'b0),                                  // (terminated)
		.reset_req_in5  (1'b0),                                  // (terminated)
		.reset_in6      (1'b0),                                  // (terminated)
		.reset_req_in6  (1'b0),                                  // (terminated)
		.reset_in7      (1'b0),                                  // (terminated)
		.reset_req_in7  (1'b0),                                  // (terminated)
		.reset_in8      (1'b0),                                  // (terminated)
		.reset_req_in8  (1'b0),                                  // (terminated)
		.reset_in9      (1'b0),                                  // (terminated)
		.reset_req_in9  (1'b0),                                  // (terminated)
		.reset_in10     (1'b0),                                  // (terminated)
		.reset_req_in10 (1'b0),                                  // (terminated)
		.reset_in11     (1'b0),                                  // (terminated)
		.reset_req_in11 (1'b0),                                  // (terminated)
		.reset_in12     (1'b0),                                  // (terminated)
		.reset_req_in12 (1'b0),                                  // (terminated)
		.reset_in13     (1'b0),                                  // (terminated)
		.reset_req_in13 (1'b0),                                  // (terminated)
		.reset_in14     (1'b0),                                  // (terminated)
		.reset_req_in14 (1'b0),                                  // (terminated)
		.reset_in15     (1'b0),                                  // (terminated)
		.reset_req_in15 (1'b0)                                   // (terminated)
	);

endmodule
