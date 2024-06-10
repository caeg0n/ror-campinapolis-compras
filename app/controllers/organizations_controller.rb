class OrganizationsController < ApplicationController
  include ResponseHandler
  before_action :set_organization, only: [:show, :update, :destroy]
  
  def login
    gatilho = false
    token = nil
    organization = {}
    #rsa_private = OpenSSL::PKey::RSA.generate 2048
    #rsa_public = rsa_private.public_key
    data = login_data['login']
    Organization.all.each do |org|
      username = org.username
      password = org.password
      organization = org
      result = Digest::MD5.hexdigest(username.upcase+password)
      if (result == data)
        gatilho = true
        #token = JWT.encode result, rsa_private, 'RS256'
        break
      end
    end
    if (gatilho)
      render json: {"token":token,"organization":organization}
    else
      render json: {error: "erro",status: 400}, status: 400
    end 
  end

  def index
    @organizations = Organization.all
    render json: @organizations
  end

  def update_state
    uuid = update_state_params["uuid"]
    is_open = update_state_params["is_open"]
    auth = OrganizationDevice.find_by(device_id:uuid)
    auth = OrganizationDevice.find_by(device_id:uuid).status if auth.present?
    return render_json_response(message:"not_authorized", state: ResponseHandler::STATES[:not_authorized]) if not auth.present?
    return render_json_response(message:"not_authorized", state: ResponseHandler::STATES[:not_authorized]) if auth != "enabled"    
    return render_json_response(message:"invalid_value", state: ResponseHandler::STATES[:invalid_value]) if not ( is_open.is_a?(TrueClass) || is_open.is_a?(FalseClass) )
    organization_id = OrganizationDevice.find_by(device_id:uuid).organization_id
    return render_json_response(message:"not_found", state: ResponseHandler::STATES[:not_found]) if organization_id == nil
    organization = Organization.find_by(id:organization_id)
    organization.open = is_open
    organization.save 
    return render_json_response(obj:{is_open: Organization.find_by(id:organization_id).open}, message:"success", state: ResponseHandler::STATES[:success])
  end

  def update_organization_delivery_type
    params = delivery_type_params
    uuid = params["uuid"]
    delivery_type = params["delivery_type"]
    state = params["state"]
    organization_device = OrganizationDevice.where(device_id:uuid)
    organization = Organization.find(organization_device.first.organization_id) if organization_device.count > 0
    organization.delivery_type = :my_org if delivery_type == "my_org" and state == true and organization_device.count > 0
    organization.delivery_type = :camp_entregas if delivery_type == "camp_entregas" and state == true if organization_device.count > 0
    organization.save if organization_device.count > 0
  end

  def show
    id = show_params[:id]
    organization = Organization.find_by(id:id)
    filtered_organization = organization.attributes.slice("id","name","open") if organization
    if organization
      render json: filtered_organization.to_json
    end
  end

  # def create
  #   @organization = Organization.new(organization_params)
  #   if @organization.save
  #     render json: @organization, status: :created, location: @organization
  #   else
  #     render json: @organization.errors, status: :unprocessable_entity
  #   end
  # end

  def get_all_with_distinct_category
    render json: Organization.all.uniq.group_by(&:category_base)
  end

  def opened_organizations
    render json: Organization.where(open: true)
  end

  def closed_organizations
    tempObj = {}
    result = []
    organizations = Organization.where(open: false)
    organizations.each do |organization|
      tempObj = { "distance": "",
                  "id": organization.id,
                  "image": organization.logo,
                  "rating": 5,
                  "subTitle": organization.category_base,
                  "time": "",
                  "title": organization.name,
                }
      result.push(tempObj)
    end
    render json: result 
  end

  def opened_organizations
    tempObj = {}
    result = []
    organizations = Organization.where(open: true)
    organizations.each do |organization|
      tempObj = { "distance": "",
                  "id": organization.id,
                  "image": organization.logo,
                  "rating": 5,
                  "subTitle": organization.category_base,
                  "time": "",
                  "title": organization.name,
                }
      result.push(tempObj)
    end
    render json: result 
  end

  def most_popular
    tempObj = {}
    result = []
    organizations = Organization.where(open: true)
    organizations.each do |organization|
      tempObj = {
        image: organization.cover, 
        id: organization.id,
        title: organization.name,
        subTitle: organization.category_base,
        distance: "",
        time: "",
        rating: 5,
      }
      result.push(tempObj)
    end
    render json: result
  end

  def recommended_places
    tempObj = {}
    result = []
    organizations = Organization.where(open: true)
    organizations.each do |organization|
      tempObj = { "distance": "",
                  "id": organization.id,
                  "image": organization.cover,
                  "rating": 5,
                  "subTitle": organization.category_base,
                  "time": "",
                  "title": organization.name,
                }
      result.push(tempObj)
    end
    render json: result
  end

  def hot_deals
    tempObj = {}
    result = []
    organizations = Organization.where(open: true)
    organizations.each do |organization|
      tempObj = { "distance": "",
                  "id": organization.id,
                  "image": organization.logo,
                  "rating": 5,
                  "subTitle": organization.category_base,
                  "time": "",
                  "title": organization.name,
                }
      result.push(tempObj)
    end
    render json: result
  end

  def get_categories_and_products
    categories = Category.all
    grouped_categories = categories.group_by { |category| category.organization_id }
    result = grouped_categories.map do |organization_id, categories|
      {
        organization_id: organization_id,
        categories: categories.map do |category|
          {
            title: category.name,
            products: Product.where(category_id:category.id).map do |product|
              {
                id: product.id,
                title: product.name,
                description: product.description,
                price: product.price,
                image: product.img,
                organization_id: product.organization_id
              }
            end
          }
        end
      }  
    end
    render json: result
  end

  def get_categories_and_products_by_organization
    organization_id = get_categories_and_products_by_organization_params[:organization_id]
    categories = Category.where(organization_id: organization_id)
    grouped_categories = categories.group_by(&:organization_id)
    result = grouped_categories.map do |org_id, categories|
      {
        organization_id: org_id,
        categories: categories.map do |category|
          {
            title: category.name,
            products: Product.where(category_id: category.id).map do |product|
              {
                id: product.id,
                title: product.name,
                description: product.description,
                price: product.price,
                image: product.img,
                organization_id: product.organization_id,
                category_id: product.category_id
              }
            end
          }
        end
      }
    end
    render json: result
end


  # def update
  #   if @organization.update(organization_params)
  #     render json: @organization
  #   else
  #     render json: @organization.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @organization.destroy
  # end

  private

    def get_categories_and_products_by_organization_params
      params.permit(:organization_id,:format)
    end

    def show_params
      params.permit(:id)
    end

    def update_state_params
      params.require(:organization).permit(:uuid, :is_open)
    end
    
    def delivery_type_params
      params.require(:organization).permit(:uuid, :delivery_type, :state)
    end

    def status_params
      params.require(:organization).permit(:organization, :state)
    end

    def organization_params
      params.require(:organization).permit(:name, :cel, :logo)
    end

    def set_organization
      @organization = Organization.find(params[:id])
    end

    def login_data
      params.permit(:login) 
    end 
end
