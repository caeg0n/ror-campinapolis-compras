class OrganizationCategoryTagsController < ApplicationController
  before_action :set_organization_category_tag, only: [:show, :update, :destroy]

  def index
    @organization_category_tags = OrganizationCategoryTag.all
    render json: @organization_category_tags
  end

  # def show
  #   render json: @organization_category_tag
  # end

  # def create
  #   @organization_category_tag = OrganizationCategoryTag.new(organization_category_tag_params)
  #   if @organization_category_tag.save
  #     render json: @organization_category_tag, status: :created, location: @organization_category_tag
  #   else
  #     render json: @organization_category_tag.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @organization_category_tag.update(organization_category_tag_params)
  #     render json: @organization_category_tag
  #   else
  #     render json: @organization_category_tag.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @organization_category_tag.destroy
  # end

  private
    def set_organization_category_tag
      @organization_category_tag = OrganizationCategoryTag.find(params[:id])
    end

    def organization_category_tag_params
      params.require(:organization_category_tag).permit(:organization_id, :tag)
    end
end
