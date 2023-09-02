class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id', dependent: :destroy
  has_many :posts, class_name: 'Post', foreign_key: 'author_id', dependent: :destroy
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts
    posts.where(author_id: id).order(created_at: :desc).limit(3)
  end

  after_create :check_posts_counter

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user' || role.nil?
  end

  private

  def check_posts_counter
    user = User.find(id)
    user.posts_counter = 0 if user.posts_counter.nil?
    user.save
  end
end
