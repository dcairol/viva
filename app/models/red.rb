class Red < ActiveRecord::Base
  belongs_to :region
  belongs_to :iglesia
  validates :nombre, presence: true
end
