require 'rails_helper'

describe EmpresasController do
  render_views
  describe 'get #index' do
    before :each do
      @empresa = create(:empresa)
    end
    #context 'Collection de empresas en vble @empresas' do
    it 'Retorne una coleccion en @empresas' do
     get :index
      expect(assigns(:empresas)).to include(@empresa)
    end

    it 'Retorna un JSON con el listado de empresas' do
      get :index,  :format => :json
      expect(JSON.parse(response.body)).to be_an Array
    end

    it 'Retorna archivo CSV' do
      get :index, :format => :csv
      expect(response.headers['Content-Type']).to eq 'application/octet-stream'
    end

    it 'Retorna archivo XLS' do
      get :index, :format => :xls
      p response.headers
    end

    it 'Render de la vista :index' do
      get :index
      expect(response).to render_template :index
    end

  end

  describe 'get #show' do
    before :each do
      @empresa = create(:empresa)
    end
    it 'Retorne un objeto en vble @empresas' do
      get :show, id: @empresa
      expect(assigns(:empresa)).to eq @empresa
    end
    it 'Render de la vista :show' do
      get :show, id: @empresa
      expect(response).to render_template :show
    end

  end

  describe 'get #edit' do
    before :each do
      @empresa = create(:empresa)
    end
    it 'Retorne un objeto en vble @empresas' do
      get :edit, id: @empresa
      expect(assigns(:empresa)).to eq @empresa
    end
    it 'Render de la vista :edit' do
      get :edit, id: @empresa
      expect(response).to render_template :edit
    end

  end

  describe 'post #new' do
    it 'Retorne un objeto en vble @empresas' do
      get :new
      expect(assigns(:empresa)).to be_a_new(Empresa)
    end
    it 'Render de la vista :new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'post #create'
  context 'Con datos validos' do
    it 'Guardar nueva empresa en BD' do
      p 'pailaaa'
      p Empresa.all

      expect {
        post :create, empresa: attributes_with_foreign_keys(:empresa)
      }.to change(Empresa, :count).by(1)
    end
    it 'redireccion al :show de la empresa creada' do
      post :create, empresa: attributes_with_foreign_keys(:empresa)
      expect(response).to redirect_to empresa_path(assigns(:empresa))
    end
  end

  context 'Con datos invalidos' do
    it 'No se guardo registro en BD' do
      expect {
        post :create, empresa: attributes_with_foreign_keys(:empresa_invalida, nombre: nil)
      }.not_to change(Empresa, :count)
    end

    it 'Redireccion de la vista :new' do
      post :create, empresa: attributes_with_foreign_keys(:empresa_invalida)
      expect(response).to render_template :new

    end
  end

  describe 'patch #update' do
    before :each do
      @empresa = create(:empresa)
    end
    context 'Con datos validos' do
      it 'Debe actualizar la empresa en la BD' do
        patch :update, id: @empresa, empresa: attributes_for(:empresa, nombre: 'Visionamos')
        @empresa.reload
        expect(@empresa.nombre).to eq 'Visionamos'
      end
      it 'Debe redireccionar a la vista :show' do
        patch :update, id: @empresa, empresa: attributes_for(:empresa, nombre: 'Visionamos')
        expect(response).to redirect_to empresa_path(@empresa)
      end

    end

    context 'Con datos NO validos' do
      it 'No debe guardar en BD' do
        patch :update, id: @empresa, empresa: attributes_for(:empresa_invalida)
        @empresa.reload
        expect(@empresa.nombre).not_to eq nil
      end

      it 'Debe hacer render de la vista :edit' do
        patch :update, id: @empresa, empresa: attributes_for(:empresa_invalida)
        @empresa.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe 'destroy #destroy' do
    before :each do
      @empresa = create(:empresa)
    end
    it 'Elimina empresa' do
      expect {
        delete :destroy, id: @empresa
      }.to change(Empresa, :count).by(-1)
    end

    it 'Debe redireccionar la vista :index' do
      delete :destroy, id: @empresa
      expect(response).to redirect_to empresas_path
    end

  end

end