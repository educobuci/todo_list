class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, :dependent => :destroy
  validates_presence_of :name
  accepts_nested_attributes_for :items, :reject_if => lambda { |i| i[:name].blank? }, :allow_destroy => true
  scope :publics, where(:public => 1)
  scope :excluding_user, lambda {|id| where("user_id <> ?", id) }
end
