class Order < ApplicationRecord
	belongs_to :product

	enum order_status_block_list: [:block_1,
																 :block_4,
																 :block_15,
																 :block_17,
																 :block_18,
																 :block_19,
																 :block_20,
																 :block_22,
																 :block_23
																]


	enum order_status_base_list: ["0","3","5","6","7","8","15"]
											
	enum order_status_list: {
											pedido_enviado:0,
											cliente_cancelou_o_pedido:1,
										  _recebeu_seu_pedido:2,
										  _aceitou_seu_pedido:3,
											_cancelou_seu_pedido:4,
											_esta_preparando_seu_pedido:5,
											_esta_aguardando_o_entregador:6,
											entregador_a_caminho_do_pedido:7,
											entregador_saiu_para_entrega:8,
											entregador_a_caminho_do_seu_endereco:9,
											_trocou_de_entregador:10,
											_enviou_mais_um_entregador:11,
											entregador_desistiu_da_entrega:12,
											entregador_nao_localizou_o_endereço:13,
											entregador_nao_retornou:14,
											entregador_concluiu_a_entrega:15,
											_vai_efetuar_uma_nova_entrega:16,
											_desistiu_da_entrega:17,
											cliente_rejeitou_a_entrega:18,
											cliente_desistiu_da_entrega:19,
											entrega_efetuada:20,
											entrega_recebida:21,
											produto_entregue:22,
											cancelado_pela_plataforma:23
									}
	
									
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


