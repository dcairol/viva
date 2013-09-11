class Oficina < ActiveRecord::Base
  validates :nombre,presence: true
end
