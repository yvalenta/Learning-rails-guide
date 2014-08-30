class CreateCiudades < ActiveRecord::Migration
  def change
    create_table :ciudades do |t|
      t.string :nombre
      t.string :cod_dane
      t.references :departamento, index: true

      t.timestamps
    end
  end
end
