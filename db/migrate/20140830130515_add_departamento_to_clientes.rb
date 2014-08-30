class AddDepartamentoToClientes < ActiveRecord::Migration
  def change
    add_reference :clientes, :departamento, index: true
  end
end
