class Iglesia < ActiveRecord::Base
  belongs_to :region
  has_many :ninos
  validates :nombre, presence: true
  validates :pastor, presence: true
  validates :region_id, presence: true
end
