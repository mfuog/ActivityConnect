class Activity < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments 
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, source: :user

  def participant?(user)
    participants.any? { |p| p.id == user.id }
  end

  validates :author, presence: true
end
