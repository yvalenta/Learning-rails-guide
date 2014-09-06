require 'rails_helper'

describe Empresa do
  describe 'validaciones' do

    it 'Es valido con nombre y ciudad' do
      empresa = Empresa.new( nombre: 'Empresa del Perro',
                             departamento_id: 1,
                             ciudad_id: 1)
      expect(empresa).to be_valid
    end
    it 'Es invalido sin nombre' do
      empresa = Empresa.new( nombre:nil )
      empresa.valid?
      p empresa.errors[:nombre]
      expect(empresa.errors[:nombre].count).to eq 1
    end
    it 'Es invalido sin ciudad' do
      empresa = Empresa.new( ciudad_id:nil)
      empresa.valid?
      p empresa.errors[:ciudad_id]
      expect(empresa.errors[:ciudad_id].count).to eq 1
    end
    it 'Es invalido sin departamento' do
      empresa = Empresa.new( departamento_id:nil)
      empresa.valid?
      p empresa.errors[:departamento_id]
      expect(empresa.errors[:departamento_id].count).to eq 1
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
    context 'listado de empresas' do
      it 'Debe retornar una coleccion de varias empresas' do
        empresa = Empresa.create( nombre: 'empresa perro1', departamento_id: 1, ciudad_id: 1 )
        empresa1 = Empresa.create( nombre: 'empresa perro2', departamento_id: 1, ciudad_id: 1 )
        expect(Empresa.search('err')).to eq [empresa, empresa1]
      end

      it 'Debe retornar una coleccion de un asola empresa' do
        empresa = Empresa.create( nombre: 'empresa perro1', departamento_id: 1, ciudad_id: 1 )
        empresa1 = Empresa.create( nombre: 'empresa perro2', departamento_id: 1, ciudad_id: 1 )
        expect(Empresa.search('paila')).not_to eq [empresa, empresa1]
      end

    end

    context 'busqueda de empresa sin resultado' do
      it 'Debe retornar una coleccion de empresa vaciss'

    end

  end



end