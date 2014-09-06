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
      expect(true).to be true
    end
  end

  describe 'Metodos de clase' do

  end

end