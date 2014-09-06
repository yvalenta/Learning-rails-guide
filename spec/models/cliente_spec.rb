require 'rails_helper'

describe Cliente do

  describe 'validaciones' do
    before :each do
      @cliente = build(:cliente)
    end

    it 'Es valido con nombre y ciudad' do
      expect(@cliente).to be_valid
    end

    it 'Es invalido sin nombre' do
      @cliente.nombre = nil
      @cliente.valid?
      expect(@cliente.errors[:nombre].count).to eq 1
    end
    it 'Es invalido sin ciudad' do
      @cliente.ciudad_id = nil
      @cliente.valid?
      expect(@cliente.errors[:ciudad_id].count).to eq 1
    end
    it 'Es invalido sin departamento' do
      @cliente.departamento_id = nil
      @cliente.valid?
      expect(@cliente.errors[:departamento_id].count).to eq 1
    end

  end

  describe 'Metodos de instancia' do
    it 'Debe retornar 10 veces el nombre' do
      cliente = build( :cliente )
      expect(cliente.nombrelo).to eq(cliente.nombre * 10)
    end
  end

  describe 'Metodos de clase' do
    before :each do
      @telecom =  create( :cliente, nombre: 'Telecom' )
      @colombiano = create( :cliente, nombre: "El colombiano" )
      create( :cliente )
    end


    context 'listado de clientes' do
      it 'Debe retornar una coleccion de varias clientes' do
        expect(Cliente.search('om')).to include @telecom, @colombiano
      end

      it 'Debe retornar una coleccion de una sola clientes' do
        expect(Cliente.search('colombiano')).to include @colombiano
      end

    end

    context 'busqueda de clientes sin resultado' do
      it 'Debe retornar una coleccion de clientes vacia' do
        expect(Cliente.search('entrega')).not_to include @colombiano
      end
    end

  end
end
