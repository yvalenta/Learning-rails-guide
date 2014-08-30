class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.string :cod_dane

      t.timestamps
    end
  end
end
