namespace :db do
  desc "TODO"
  task destroy_all: :environment do
  	Address.destroy_all
  	Delivery.destroy_all
  	Order.destroy_all
  	Product.destroy_all
  	Organization.destroy_all
  	Product.destroy_all
  	Notification.destroy_all
    Category.destroy_all
    OrganizationCategoryTag.destroy_all
  end

end
