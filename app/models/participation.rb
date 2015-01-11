class Participation < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  
  validates :activity, presence: true
  validates :user, presence: true
end