class AddDepartamentoToEmpresas < ActiveRecord::Migration
  def change
    add_reference :empresas, :departamento, index: true
  end
end
