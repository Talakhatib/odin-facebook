class Post < ApplicationRecord

    belongs_to :user ,class_name:"User"

    has_many :comments , foreign_key: :post_id , class_name:"Comment", dependent: :destroy

    has_many :likes , foreign_key: :post_id , class_name:"Like" , dependent: :destroy
    has_many :like_users , through: :likes, source: :user

    has_one_attached :image
    default_scope -> {order(created_at: :desc)}
    
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum:140}
    validates :image, content_type: { in: %w[image/jpeg image/gif image/png], message: "must be a valid image format" },
    size: { less_than: 5.megabytes, message: "should be less than 5MB" }
end
