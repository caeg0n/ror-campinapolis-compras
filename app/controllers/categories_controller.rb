class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    #@categories = Category.all
    @categories = Category.all.uniq { |p| p.name }
    render json: @categories
  end


  def get_organizations
    result = []
    pa = params['name']
    organizations = Category.where(name:pa).select("organization_id").uniq { |p| p.organization_id }
    organizations.each do |organization|
      result.push(Organization.where(id:organization.organization_id))
    end
    render json: result.flatten
  end

  # def show
  #   render json: @category
  # end

  # def create
  #   @category = Category.new(category_params)
  #   if @category.save
  #     render json: @category, status: :created, location: @category
  #   else
  #     render json: @category.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @category.update(category_params)
  #     render json: @category
  #   else
  #     render json: @category.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @category.destroy
  # end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:organization_id, :name)
    end
end
