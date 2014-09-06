class Empresa < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :departamento

  def nombre_largo
    'oe' * 10
  end
end
