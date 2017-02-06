class Type < ActiveRecord::Base
  has_many :listings
  validates :category, :presence => true
end
