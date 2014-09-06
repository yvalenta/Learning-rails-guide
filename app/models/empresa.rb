class Empresa < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :departamento

  validates :ciudad_id, presence: true
  validates :departamento_id, presence: true
  validates :nombre, presence: true

  def nombre_largo
    self.nombre * 10
  end
end
