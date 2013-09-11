require 'test_helper'

class IglesiaControllerTest < ActionController::TestCase
  setup do
    @iglesium = iglesia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iglesia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iglesium" do
    assert_difference('Iglesium.count') do
      post :create, iglesium: { compromiso_economico: @iglesium.compromiso_economico, contacto_administrativo: @iglesium.contacto_administrativo, coordinadores: @iglesium.coordinadores, correos: @iglesium.correos, direccion: @iglesium.direccion, pastor: @iglesium.pastor, region_id: @iglesium.region_id, telefono: @iglesium.telefono }
    end

    assert_redirected_to iglesium_path(assigns(:iglesium))
  end

  test "should show iglesium" do
    get :show, id: @iglesium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iglesium
    assert_response :success
  end

  test "should update iglesium" do
    patch :update, id: @iglesium, iglesium: { compromiso_economico: @iglesium.compromiso_economico, contacto_administrativo: @iglesium.contacto_administrativo, coordinadores: @iglesium.coordinadores, correos: @iglesium.correos, direccion: @iglesium.direccion, pastor: @iglesium.pastor, region_id: @iglesium.region_id, telefono: @iglesium.telefono }
    assert_redirected_to iglesium_path(assigns(:iglesium))
  end

  test "should destroy iglesium" do
    assert_difference('Iglesium.count', -1) do
      delete :destroy, id: @iglesium
    end

    assert_redirected_to iglesia_path
  end
end
