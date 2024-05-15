class Payment < ApplicationRecord
    enum payment_type: {
                            "Dinheiro na Entrega":1,
                            "Cartão de Crédito na entrega":2,
                            "Cartão de Débito na entrega":3,
                            "Anotar na minha conta":4,
                            "Pix":5
                        } 
end
