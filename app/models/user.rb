class User < ActiveRecord::Base
  has_many :authored_activities, class_name: "Activity", foreign_key: "author_id"
  has_many :signups, dependent: :destroy
  has_many :joint_activities, through: :signups, source: :activity
  has_many :comments

  enum role: [:user, :caretaker, :admin]
  after_initialize :set_default_role, :if => :new_record?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private
  
  def set_default_role
    self.role ||= :user
  end
end
