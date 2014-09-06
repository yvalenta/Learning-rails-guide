class Cliente < ActiveRecord::Base
  include Searchable

  belongs_to :ciudad
  belongs_to :departamento

  validates :ciudad_id, presence: true
  validates :departamento_id, presence: true
  validates :nombre, presence: true


  def nombrelo
    self.nombre * 10
  end

end
