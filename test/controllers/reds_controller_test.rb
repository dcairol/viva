require 'test_helper'

class RedsControllerTest < ActionController::TestCase
  setup do
    @red = reds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create red" do
    assert_difference('Red.count') do
      post :create, red: { condiciones: @red.condiciones, direccion: @red.direccion, fecha_nacimiento: @red.fecha_nacimiento, region_id: @red.region_id, servicio: @red.servicio, telefono: @red.telefono }
    end

    assert_redirected_to red_path(assigns(:red))
  end

  test "should show red" do
    get :show, id: @red
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @red
    assert_response :success
  end

  test "should update red" do
    patch :update, id: @red, red: { condiciones: @red.condiciones, direccion: @red.direccion, fecha_nacimiento: @red.fecha_nacimiento, region_id: @red.region_id, servicio: @red.servicio, telefono: @red.telefono }
    assert_redirected_to red_path(assigns(:red))
  end

  test "should destroy red" do
    assert_difference('Red.count', -1) do
      delete :destroy, id: @red
    end

    assert_redirected_to reds_path
  end
end
