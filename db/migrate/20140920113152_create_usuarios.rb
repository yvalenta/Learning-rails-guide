class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :password
      t.string :email

      t.timestamps
    end
  end
end
