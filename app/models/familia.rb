class Familia < ActiveRecord::Base
  belongs_to :iglesia
  has_many :ninos
  validates :nombre, presence: true
end
