class Familia < ActiveRecord::Base
  belongs_to :iglesia
  validates :nombre, presence: true
end
