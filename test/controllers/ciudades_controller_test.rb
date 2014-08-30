require 'test_helper'

class CiudadesControllerTest < ActionController::TestCase
  setup do
    @ciudad = ciudades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ciudades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ciudad" do
    assert_difference('Ciudad.count') do
      post :create, ciudad: { cod_dane: @ciudad.cod_dane, departamento_id: @ciudad.departamento_id, nombre: @ciudad.nombre }
    end

    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  test "should show ciudad" do
    get :show, id: @ciudad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ciudad
    assert_response :success
  end

  test "should update ciudad" do
    patch :update, id: @ciudad, ciudad: { cod_dane: @ciudad.cod_dane, departamento_id: @ciudad.departamento_id, nombre: @ciudad.nombre }
    assert_redirected_to ciudad_path(assigns(:ciudad))
  end

  test "should destroy ciudad" do
    assert_difference('Ciudad.count', -1) do
      delete :destroy, id: @ciudad
    end

    assert_redirected_to ciudades_path
  end
end
