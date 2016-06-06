require 'test_helper'

class LawCollectionsControllerTest < ActionController::TestCase
  setup do
    @law_collection = law_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:law_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create law_collection" do
    assert_difference('LawCollection.count') do
      post :create, law_collection: { abbrevation: @law_collection.abbrevation, name: @law_collection.name, url: @law_collection.url }
    end

    assert_redirected_to law_collection_path(assigns(:law_collection))
  end

  test "should show law_collection" do
    get :show, id: @law_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @law_collection
    assert_response :success
  end

  test "should update law_collection" do
    patch :update, id: @law_collection, law_collection: { abbrevation: @law_collection.abbrevation, name: @law_collection.name, url: @law_collection.url }
    assert_redirected_to law_collection_path(assigns(:law_collection))
  end

  test "should destroy law_collection" do
    assert_difference('LawCollection.count', -1) do
      delete :destroy, id: @law_collection
    end

    assert_redirected_to law_collections_path
  end
end
