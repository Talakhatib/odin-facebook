class User < ApplicationRecord
  
  has_many :posts , foreign_key: :user_id, class_name:"Post", dependent: :destroy
  has_many :comments , foreign_key: :user_id, class_name:"Comment", dependent: :destroy

  has_many :likes , foreign_key: :user_id , class_name:"Like" , dependent: :destroy
  has_many :like_posts , through: :likes

  has_many :friend_requests , foreign_key: :from_user_id , class_name: "FriendRequest", dependent: :destroy
  has_many :to_friends , through: :friend_requests , source: :to_user
  
  has_many :friend_responses , foreign_key: :to_user_id, class_name: "FriendRequest" , dependent: :destroy
  has_many :from_friends , through: :friend_responses , source: :from_user

  has_many :current_user_friends , foreign_key: :current_user_id ,class_name:"Friend" , dependent: :destroy
  has_many :current_friends , through: :current_user_friends , source: :other_user
  
  has_many :other_user_friends , foreign_key: :other_user_id ,class_name:"Friend" , dependent: :destroy
  has_many :other_friends , through: :other_user_friends , source: :current_user

  after_create :send_admin_mail

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :date_of_birth, presence: true

  def send_admin_mail
    UserMailer.welcome_email(self).deliver_now
  end
end
