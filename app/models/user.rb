class User < ActiveRecord::Base
  has_many :authored_activities, class_name: "Activity", foreign_key: "author_id"
  has_many :participations, dependent: :destroy
  has_many :joint_activities, through: :participations, source: :activity
  has_many :comments
  enum role: [:admin, :caregiver, :user]
  after_initialize :set_default_role, :if => :new_record?

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  
  def set_default_role
    self.role ||= :user
  end
end
