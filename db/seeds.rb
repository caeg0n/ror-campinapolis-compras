require 'digest/md5'
#tabacaria aguiar
Address.destroy_all
Payment.destroy_all
Payment.create(name:'Dinheiro na Entrega',icon:'cash',payment_type:1)
Payment.create(name:'Cartão de Crédito na Entrega',icon:'card',payment_type:2)
Payment.create(name:'Cartão de Débito na Entrega',icon:'card-outline',payment_type:3)
Payment.create(name:'Anotar na Minha Conta',icon:'thumbs-down',payment_type:4)
Payment.create(name:'Pagar com PIX',icon:'swap-horizontal',payment_type:5)

Organization.destroy_all
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Tabacaria Aguiar',category_base:'tabacaria',cel: '66981053385',
	                username:'pc'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0',password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1612061953/camp-delivery/logos/tabacaria.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615574827/camp-delivery/covers/tabaca.jpg")
# #upa distribuidora
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Upa Distribuidora',category_base:'distribuidora de bebidas', cel: '66981053385',
	                username:'marcelo'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1612061965/camp-delivery/logos/upa.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615575221/camp-delivery/covers/WhatsApp-Image-2019-02-16-at-22.21.00.jpg")
#countnineburger
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'CountNineBurgerCamp', cel: '',category_base:'hamburgueria',
	                username:'countnine'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615420177/camp-delivery/logos/0bf05726-dc72-4087-aa08-c510ff702dd2_rw_1200.jpg",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615469094/camp-delivery/covers/fd0c77c0-698f-4022-a454-6c5d9180b666_rw_1200.jpg")

#creme mel
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Creme Mel', cel: '',category_base:'lanchonete',
	                username:'elon'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615486468/camp-delivery/logos/images.jpg",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615517026/camp-delivery/covers/logo.png")

#rende mais
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Super Rende Mais', cel: '',category_base:'supermercado',
	                username:'sergio'.upcase,delivery_fee: '2.0',minimal_buy_price:'20.0', password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615495782/camp-delivery/logos/ecjmpl87pl68sqxizk7i.jpg",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615496826/camp-delivery/covers/70846134_1285757818263221_1253962478556020736_o.png.png")

#marbo
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Marbo Supermercado', cel: '',category_base:'supermercado',
	                username:'marcelia'.upcase,delivery_fee: '2.0',minimal_buy_price:'20.0', password:Digest::MD5.hexdigest('123'.upcase),open:true,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615810231/camp-delivery/logos/144106579_3404490322993490_3877742609228070049_o.jpg",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615810280/camp-delivery/covers/241865_790774994365049_6618817286463091179_o.jpg")

#acai do ninho
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Açaí do Ninho', cel: '',category_base:'acaiteria',
	                username:'ninho'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:false,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616261397/camp-delivery/logos/logo_acai_do_ninho.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616261496/camp-delivery/covers/131892674_765699760681990_5204400102889843417_o.jpg")


#casa de carnes badoy
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Casa de Carnes do Badoy', cel: '',category_base:'acougue',
	                username:'badoy'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:false,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616344157/camp-delivery/logos/badoy_logo.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616344336/camp-delivery/covers/Sem_t%C3%ADtulo.jpg")


#olive pizza
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Olive Delivery Pizza', cel: '',category_base:'pizzaria',
	                username:'olive'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:false,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616719655/camp-delivery/logos/Captura_de_Tela_2021-03-25_%C3%A0s_21.04.38.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616718710/camp-delivery/covers/svogb2eu6r5vi0hgc8l3.jpg")


#olive pizza
Organization.create(organization_status:2,token:nil,organization_type:0,name: 'Via Net Informática', cel: '',category_base:'loja de informatica',
	                username:'leonel'.upcase,delivery_fee: '2.0',minimal_buy_price:'10.0', password:Digest::MD5.hexdigest('123'.upcase),open:false,
	                logo:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616871002/camp-delivery/logos/78805356_105464340947965_4967109195124965376_n.png",
					cover:"https://res.cloudinary.com/campinapolis-com/image/upload/v1616871193/camp-delivery/covers/78805356_105464340947965_4967109195124965376_n.png")


Organization.create(organization_status:2,token:nil,organization_type:1,name: 'Borrachinha', cel: '6681063437',
	                username:'borracha'.upcase, password:Digest::MD5.hexdigest('123'.upcase))


Organization.create(organization_status:2,token:nil,organization_type:2,name: 'Carlos Eduardo', cel: '66981102799',
	                username:'admin'.upcase, password:Digest::MD5.hexdigest('123'.upcase))
puts "Organizações criadas " + Organization.count.to_s
tabacaria_id = Organization.where(name: 'Tabacaria Aguiar').first.id
upa_id = Organization.where(name: 'Upa Distribuidora').first.id
countnine_id = Organization.where(name: 'CountNineBurgerCamp').first.id
rendemais_id = Organization.where(name: 'Super Rende Mais').first.id 
crememel_id = Organization.where(name: 'Creme Mel').first.id
marbo_id = Organization.where(name: 'Marbo Supermercado').first.id
ninho_id = Organization.where(name: 'Açaí do Ninho').first.id
badoy_id = Organization.where(name: 'Casa de Carnes do Badoy').first.id
olive_id = Organization.where(name: 'Olive Delivery Pizza').first.id
vianet_id = Organization.where(name: 'Via Net Informática').first.id

Product.destroy_all
Category.destroy_all
Category.create(organization_id:tabacaria_id,name:"narguiles",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-lanches-v2.jpg")
Category.create(organization_id:tabacaria_id,name:"essencias",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-lanches-v2.jpg")
Category.create(organization_id:tabacaria_id,name:"terere",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-lanches-v2.jpg")
Category.create(organization_id:countnine_id,name:"lanches",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-lanches-v2.jpg")
Category.create(organization_id:crememel_id,name:"lanches",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-lanches-v2.jpg")
Category.create(organization_id:crememel_id,name:"pizzas",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-pizza.jpg")
Category.create(organization_id:olive_id,name:"pizzas",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-pizza.jpg")
Category.create(organization_id:badoy_id,name:"carnes",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-carnes.jpg")
Category.create(organization_id:ninho_id,name:"acai",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-acai.jpg")
Category.create(organization_id:upa_id,name:"bebidas",image_url:"https://static-images.ifood.com.br/image/upload/f_auto,t_low/discoveries/19C1-bebidas.jpg")
puts "Categorias criadas " + Category.count.to_s

OrganizationCategoryTag.destroy_all
OrganizationCategoryTag.create(organization_id:tabacaria_id,tag: :tabacaria)
OrganizationCategoryTag.create(organization_id:upa_id,tag: :distribuidora)
OrganizationCategoryTag.create(organization_id:countnine_id,tag: :hamburgueria)
OrganizationCategoryTag.create(organization_id:rendemais_id,tag: :supermercado)
OrganizationCategoryTag.create(organization_id:crememel_id,tag: :hamburgueria)
OrganizationCategoryTag.create(organization_id:crememel_id,tag: :sorveteria)
OrganizationCategoryTag.create(organization_id:crememel_id,tag: :pizzaria)
OrganizationCategoryTag.create(organization_id:olive_id,tag: :pizzaria)
OrganizationCategoryTag.create(organization_id:crememel_id,tag: :lanchonete)
OrganizationCategoryTag.create(organization_id:marbo_id,tag: :supermercado)
OrganizationCategoryTag.create(organization_id:ninho_id,tag: :acai)
OrganizationCategoryTag.create(organization_id:badoy_id,tag: :acougue)
OrganizationCategoryTag.create(organization_id:vianet_id,tag: :informatica)
puts "CategoriasTag criadas " + OrganizationCategoryTag.count.to_s

# Product.create(name:"Essência Premium FM Brasil",organization_id:tabacaria_id,
# 	                                             description:"tabaco bem picotado e bastante melaço, com sabor intenso e duradouro",
# 	                                             price:"1.50",
# 	                                             img:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615584882/camp-delivery/products/cigarro.png",
# 	                                             status:2,
# 												 category_id:Category.where(organization_id:tabacaria_id).order("RANDOM()").first.id)
# Product.create(name:"Mesa Para Narguile",organization_id:tabacaria_id,
# 	                   description:"Mesa Narguile em Madeira",
# 	                   price:"2.70",
# 	                   img:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615584976/camp-delivery/products/mesa.png",
# 	                   status:2,
# 					   category_id:Category.where(organization_id:tabacaria_id).order("RANDOM()").first.id)
# Product.create(name:"Erva Mate Constança",organization_id:tabacaria_id,
# 	                   description:"Erva Mate Especial Pura Folha 1kg",
# 	                   price:"3.80",
# 	                   img:"https://res.cloudinary.com/campinapolis-com/image/upload/v1615584895/camp-delivery/products/erva.png",
# 	                   status:2,
# 					   category_id:Category.where(organization_id:tabacaria_id).order("RANDOM()").first.id)
Product.create(name:"Caixa de Skol",organization_id:upa_id,
	                   description:"Caixa de Skol 12 unidades 160ml",
	                   price:"27.80",
	                   img:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuYdjXMR9z6tHwVXsWF4zwJCwYHBRZfQwmkjKiqfTtU9afG49i9g_hmKAr4YvAdtOVFNQ&usqp=CAU",
	                   status:2,
					   category_id:Category.where(organization_id:upa_id).order("RANDOM()").first.id)

puts "Produtos criados " + Product.count.to_s