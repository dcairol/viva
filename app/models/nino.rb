class Nino < ActiveRecord::Base
  belongs_to :iglesia
  belongs_to :oficina
  belongs_to :familia

  validates :nombre, presence: true
end
