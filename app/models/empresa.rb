class Empresa < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :departamento

  def nombre_largo
    self.nombre * 10
  end
end
