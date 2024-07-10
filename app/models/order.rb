class Order < ApplicationRecord
	belongs_to :product

	enum possibles_states: {"0"=>"pedido_enviado",
													"1"=>"cliente_cancelou_o_pedido",
													"2"=>"_recebeu_seu_pedido",
													"4"=>"_aceitou_seu_pedido",
													"5"=>"_cancelou_seu_pedido",
													"6"=>"_esta_preparando_seu_pedido",
													"8"=>"_esta_aguardando_o_entregador",
													"10"=>"entregador_a_caminho_do_pedido",
													"12"=>"entregador_saiu_para_entrega",
													"14"=>"_trocou_de_entregador",
													"16"=>"_enviou_mais_um_entregador",
													"18"=>"entregador_desistiu_da_entrega",
													"20"=>"entregador_nao_localizou_o_endereço",
													"22"=>"entregador_nao_retornou",
													"23"=>"entregador_concluiu_a_entrega",
													"24"=>"_vai_efetuar_uma_nova_entrega",
													"25"=>"_desistiu_da_entrega",
													"27"=>"cliente_rejeitou_a_entrega",
													"29"=>"cliente_desistiu_da_entrega",
													"30"=>"entrega_efetuada",
													"32"=>"entrega_recebida",
													"33"=>"cancelado_pela_plataforma"
												}

	enum initial_states: [:initial_0,:initial_2,:initial_4,:initial_6,:initial_8,:initial_10,:initial_12,:initial_23]

	# enum order_status_block_list: [:block_1,
	# 															 :block_4,
	# 															 :block_15,
	# 															 :block_17,
	# 															 :block_18,
	# 															 :block_19,
	# 															 :block_20,
	# 															 :block_22,
	# 															 :block_23
	# 															]


	# enum order_status_base_list: ["0","3","5","6","7","8","10","15"]
															
											
	# enum order_status_list: {
	# 										pedido_enviado:0,
	# 										cliente_cancelou_o_pedido:1,
	# 									  _recebeu_seu_pedido:2,
	# 									  _aceitou_seu_pedido:3,
	# 										_cancelou_seu_pedido:4,
	# 										_esta_preparando_seu_pedido:5,
	# 										_esta_aguardando_o_entregador:6,
	# 										entregador_a_caminho_do_pedido:7,
	# 										entregador_saiu_para_entrega:8,
	# 										entregador_a_caminho_do_seu_endereco:9,
	# 										_trocou_de_entregador:10,
	# 										_enviou_mais_um_entregador:11,
	# 										entregador_desistiu_da_entrega:12,
	# 										entregador_nao_localizou_o_endereço:13,
	# 										entregador_nao_retornou:14,
	# 										entregador_concluiu_a_entrega:15,
	# 										_vai_efetuar_uma_nova_entrega:16,
	# 										_desistiu_da_entrega:17,
	# 										cliente_rejeitou_a_entrega:18,
	# 										cliente_desistiu_da_entrega:19,
	# 										entrega_efetuada:20,
	# 										entrega_recebida:21,
	# 										produto_entregue:22,
	# 										cancelado_pela_plataforma:23
	# 								}
	
									
	enum payment: [ 
									:nada,
									:dinheiro,
									:cartao_credito,
									:cartao_debito,
									:fiado,
									:pix 
								]

	default_scope { order id: :DESC }

	def to_param
  		reference
	end

end
# class Order < ApplicationRecord
# 	belongs_to :product

# 	enum possibles_states: {
# 		client_nothing:1,
#   	organization_nothing:2,
#   	deliveryman_nothing:3,

# 		client_order_sent: 10,
# 		client_canceled_order:11,
#   	client_gave_up_delivery:13,
#   	client_rejected_delivery:15,
# 		client_received_order:16,
		
# 		organization_received_order:100,
#   	organization_accepted_order:102,
#   	organization_refused_order:103,
#   	organization_preparing_order:104,
#   	organization_waiting_for_deliveryman:106,
#   	organization_deliveryman_left_for_delivery:108,
# 		organization_deliveryman_gave_up_delivery:109,
# 		organization_changed_deliveryman:110,
# 		organization_sent_another_deliveryman:112,
# 		organization_deliveryman_did_not_return:113,
# 		organization_order_delivered:114,
		
# 		deliveryman_accept_order:1000,
# 		deliveryman_on_way_to_order:1002,
#   	deliveryman_left_for_delivery:1004,
#   	deliveryman_gave_up_delivery:1005,
#   	deliveryman_could_not_find_address_and_continue_trying:1006,
# 		deliveryman_will_make_a_new_delivery:1008,
# 		deliveryman_could_not_find_address_and_give_up:1009,
#   	deliveryman_client_rejected_delivery:1011,
# 		deliveryman_order_delivered:1012
# 	}

# 	enum state: {
#   	order_sent: [10,100],
#   	accept_your_order: [102,1000],
# 		preparing_your_order: [104],
# 		waiting_for_deliveryman: [106],
#   	deliveryman_on_way_to_order: [1002],
#   	deliveryman_left_for_delivery: [108,1004],
#   	order_delivered: [16,114,1012]
# 	}

# 	enum payment: [ 
# 									:nada,
# 									:dinheiro,
# 									:cartao_credito,
# 									:cartao_debito,
# 									:fiado,
# 									:pix 
# 								]

# 	default_scope { order id: :DESC }

# 	def to_param
#   		reference
# 	end

# end


