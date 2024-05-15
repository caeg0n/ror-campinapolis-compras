require 'test_helper'

class OrganizationCategoryTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_category_tag = organization_category_tags(:one)
  end

  test "should get index" do
    get organization_category_tags_url, as: :json
    assert_response :success
  end

  test "should create organization_category_tag" do
    assert_difference('OrganizationCategoryTag.count') do
      post organization_category_tags_url, params: { organization_category_tag: { organization_id: @organization_category_tag.organization_id, tag: @organization_category_tag.tag } }, as: :json
    end

    assert_response 201
  end

  test "should show organization_category_tag" do
    get organization_category_tag_url(@organization_category_tag), as: :json
    assert_response :success
  end

  test "should update organization_category_tag" do
    patch organization_category_tag_url(@organization_category_tag), params: { organization_category_tag: { organization_id: @organization_category_tag.organization_id, tag: @organization_category_tag.tag } }, as: :json
    assert_response 200
  end

  test "should destroy organization_category_tag" do
    assert_difference('OrganizationCategoryTag.count', -1) do
      delete organization_category_tag_url(@organization_category_tag), as: :json
    end

    assert_response 204
  end
end
