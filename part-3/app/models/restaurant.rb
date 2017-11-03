class Restaurant < ActiveRecord::Base
  validates :user_id, :name, :cuisine, :address, :city, :state, :zip, presence:true
  belongs_to :user
  has_many :reviews
end
