class Review < ActiveRecord::Base
  validates :user_id, :restaurant_id, :rating, :description, presence:true
  belongs_to :user
  belongs_to :restaurant
end
