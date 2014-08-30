class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.references :ciudad, index: true

      t.timestamps
    end
  end
end
