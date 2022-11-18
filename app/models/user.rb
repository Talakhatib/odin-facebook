class User < ApplicationRecord
  
  has_many :posts , foreign_key: :user_id, class_name:"Post", dependent: :destroy
  has_many :comments , foreign_key: :user_id, class_name:"Comment", dependent: :destroy

  has_many :likes , foreign_key: :user_id , class_name:"Like" , dependent: :destroy
  has_many :like_posts , through: :likes

  has_many :friend_requests , foreign_key: :form_user_id , class_name: "User", dependent: :destroy
  
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
