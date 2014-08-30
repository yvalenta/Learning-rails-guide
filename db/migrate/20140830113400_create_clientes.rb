class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
