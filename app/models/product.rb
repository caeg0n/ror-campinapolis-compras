class Product < ApplicationRecord
	has_many :orders
	belongs_to :organization

	def self.search_by_keyword(keyword)
    where("LOWER(name) LIKE :keyword OR LOWER(description) LIKE :keyword", keyword: "%#{keyword.downcase}%")
  end

	# enum category: [
	# 	             :generico,
	# 	             :tabacaria,
	# 	             :bebida,
	# 	             :alimento,
	# 	             :eletronico
	# 	           ]

    enum status: [
    				:excluded,
    				:paused,
    				:active,
						:out_of_stock
    			]
end
