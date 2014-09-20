require 'rails_helper'

describe CiudadesController do

  describe 'get #search' do
    before :each do
      @departamento = create(:departamento)
      @medellin = create(:ciudad, nombre: 'Medellin', departamento: @departamento)
    end
    context 'busqueda de departamentos con ciudades' do
      it 'Retorna json con arreglo de ciudades' do
        get :search, id: @departamento, format: :json
        p response.body
      end

    end

    context 'busqueda de departamentos sin ciudades' do

    end

  end
end