require 'test_helper'

class NinosControllerTest < ActionController::TestCase
  setup do
    @nino = ninos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ninos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nino" do
    assert_difference('Nino.count') do
      post :create, nino: { edad: @nino.edad, familia_id: @nino.familia_id, fecha_egreso: @nino.fecha_egreso, fecha_ingreso: @nino.fecha_ingreso, fecha_nacimiento: @nino.fecha_nacimiento, fecha_vencimiento_medida: @nino.fecha_vencimiento_medida, iglesia_id: @nino.iglesia_id, motivo_egreso: @nino.motivo_egreso, motivo_ingreso: @nino.motivo_ingreso, nombre: @nino.nombre, oficina_id: @nino.oficina_id, sexo: @nino.sexo, tipo_acogimiento: @nino.tipo_acogimiento }
    end

    assert_redirected_to nino_path(assigns(:nino))
  end

  test "should show nino" do
    get :show, id: @nino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nino
    assert_response :success
  end

  test "should update nino" do
    patch :update, id: @nino, nino: { edad: @nino.edad, familia_id: @nino.familia_id, fecha_egreso: @nino.fecha_egreso, fecha_ingreso: @nino.fecha_ingreso, fecha_nacimiento: @nino.fecha_nacimiento, fecha_vencimiento_medida: @nino.fecha_vencimiento_medida, iglesia_id: @nino.iglesia_id, motivo_egreso: @nino.motivo_egreso, motivo_ingreso: @nino.motivo_ingreso, nombre: @nino.nombre, oficina_id: @nino.oficina_id, sexo: @nino.sexo, tipo_acogimiento: @nino.tipo_acogimiento }
    assert_redirected_to nino_path(assigns(:nino))
  end

  test "should destroy nino" do
    assert_difference('Nino.count', -1) do
      delete :destroy, id: @nino
    end

    assert_redirected_to ninos_path
  end
end
