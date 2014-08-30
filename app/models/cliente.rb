class Cliente < ActiveRecord::Base
  belongs_to :ciudad
  belongs_to :departamento
end
