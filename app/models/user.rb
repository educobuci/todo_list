class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :name
  
  validates :name, :presence => true
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :lists
end
