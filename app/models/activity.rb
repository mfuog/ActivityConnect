class Activity < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments 
  has_many :signups, dependent: :destroy
  has_many :participants, through: :signups, source: :user

  validates :author, presence: true
end
