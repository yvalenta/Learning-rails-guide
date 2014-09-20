class AddApodoFromUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :apodo, :string
  end
end
