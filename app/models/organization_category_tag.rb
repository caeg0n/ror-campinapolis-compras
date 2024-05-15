class OrganizationCategoryTag < ApplicationRecord
	enum tag: [ 
		:tabacaria,
		:sorveteria,
		:distribuidora,
		:lanchonete,
		:pizzaria,
		:hamburgueria,
		:loja,
		:acai,
		:acougue,
		:supermercado,
		:informatica
		], _suffix: true
end
