require 'rails_helper'

describe Empresa do


  describe 'validaciones' do
    before :each do
      @empresa = Empresa.new( nombre: 'Empresa del Perro',
                             departamento_id: 1,
                             ciudad_id: 1)
    end
    it 'Es valido con nombre y ciudad' do
      expect(@empresa).to be_valid
    end

    it 'Es invalido sin nombre' do
      @empresa.nombre = nil
      @empresa.valid?
      expect(@empresa.errors[:nombre].count).to eq 1
    end
    it 'Es invalido sin ciudad' do
      @empresa.ciudad_id = nil
      @empresa.valid?
      expect(@empresa.errors[:ciudad_id].count).to eq 1
    end
    it 'Es invalido sin departamento' do
      @empresa.departamento_id = nil
      @empresa.valid?
      expect(@empresa.errors[:departamento_id].count).to eq 1
    end

  end

  describe 'Metodos de instancia' do
    it 'Debe retornar 10 veces el nombre' do
      empresa = Empresa.new( nombre: 'Empresa del Perro',
                             departamento_id: 1,
                             ciudad_id: 1)
      expect(empresa.nombre_largo).to eq(empresa.nombre * 10)
    end
  end

  describe 'Metodos de clase' do
    before :each do
      @telecom =  Empresa.create( nombre: 'telecom', departamento_id: 1, ciudad_id: 1 )
      @colombiano = Empresa.create( nombre: 'colombiano', departamento_id: 1, ciudad_id: 1 )
    end


    context 'listado de empresas' do
      it 'Debe retornar una coleccion de varias empresas' do
        expect(Empresa.search('om')).to eq [@telecom, @colombiano]
      end

      it 'Debe retornar una coleccion de una sola empresa' do
        expect(Empresa.search('colombiano')).to eq [@colombiano]
      end

    end

    context 'busqueda de empresa sin resultado' do
      it 'Debe retornar una coleccion de empresa vacia' do
        expect(Empresa.search('entrega')).not_to include @colombiano
      end
    end

  end



end