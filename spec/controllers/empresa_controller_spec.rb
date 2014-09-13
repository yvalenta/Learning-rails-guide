require 'rails_helper'

describe EmpresasController do

  describe 'get #index' do
    #context 'Collection de empresas en vble @empresas' do
      it 'Retorne una coleccion en @empresas' do
        empresa1 = create(:empresa)
        get :index
        expect(assigns(:empresas)).to include(empresa1)
      end
      it 'Render de la vista :index' do
        get :index
        expect(response).to render_template :index
      end

  end

  describe 'get #show' do
    it 'Retorne un objeto en vble @empresas' do
      empresa = create(:empresa)
      get :show, id: empresa
      expect(assigns(:empresa)).to eq empresa
    end
    it 'Render de la vista :show' do
      empresa = create(:empresa)
      get :show, id: empresa
      expect(response).to render_template :show
    end

  end

  describe 'get #edit' do
    it 'Retorne un objeto en vble @empresas' do
      empresa = create(:empresa)
      get :edit, id: empresa
      expect(assigns(:empresa)).to eq empresa
    end
    it 'Render de la vista :edit' do
      empresa = create(:empresa)
      get :edit, id:empresa
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


      end
  end

  describe 'patch #update' do

  end

  describe 'destroy #destroy' do

  end

end