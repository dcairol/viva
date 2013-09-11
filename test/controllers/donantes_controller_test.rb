require 'test_helper'

class DonantesControllerTest < ActionController::TestCase
  setup do
    @donante = donantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:donantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create donante" do
    assert_difference('Donante.count') do
      post :create, donante: { empresa: @donante.empresa, monto: @donante.monto, nombre: @donante.nombre, periocidad: @donante.periocidad, telefono: @donante.telefono }
    end

    assert_redirected_to donante_path(assigns(:donante))
  end

  test "should show donante" do
    get :show, id: @donante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @donante
    assert_response :success
  end

  test "should update donante" do
    patch :update, id: @donante, donante: { empresa: @donante.empresa, monto: @donante.monto, nombre: @donante.nombre, periocidad: @donante.periocidad, telefono: @donante.telefono }
    assert_redirected_to donante_path(assigns(:donante))
  end

  test "should destroy donante" do
    assert_difference('Donante.count', -1) do
      delete :destroy, id: @donante
    end

    assert_redirected_to donantes_path
  end
end
