class Organization < ApplicationRecord
	
	has_many :products
	
	enum organization_type: [:salesman,:deliveryman,:admin], _suffix: true
	enum organization_status: [:enabled,:disabled,:waiting], _suffix: true
	enum delivery_type: [:my_org, :camp_entregas]

	validates :organization_status,presence:true  
	validates :username, uniqueness: true
	validates :name, presence: true
	validates :logo, presence: true
	validates :cover, presence: true
	validates :organization_type, presence: true
	validates :password, presence: true
	validates :username, presence: true
	validates :open, :allow_nil => false,:allow_blank => false, inclusion: { in: [ true, false ],message:"não pode ficar em branco" } 

	rails_admin do
    	label "Organizações"
    	label_plural "Organizações"
    	weight -1
    	edit do
      		include_fields :organization_status,:organization_type,:open,:name,:cover,:logo,:username,:password,:cel,
					:delivery_fee,:max_price_to_fee,:minimal_buy_price
    	end
		list do
			configure :products do
         			hide
       			end
			configure :cel do
         			hide
       			end
			configure :logo do
         			hide
       			end
			configure :token do
         			hide
       			end
			configure :cover do
         			hide
       			end
			configure :delivery_fee do
         			hide
       			end
			configure :max_price_to_fee do
         			hide
       			end
			configure :minimal_buy_price do
         			hide
       			end
		end
  	end
end
