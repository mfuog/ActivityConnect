class Signup < ActiveRecord::Base
  belongs_to :activity
  belongs_to :participant, class_name: "User"
  
  validates :activity, presence: true
  validates :participant, presence: true
end