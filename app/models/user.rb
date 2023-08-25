class User < ApplicationRecord
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, :allow_nil => true,  numericality: { greater_than_or_equal_to: 0 }
  

  def recent_posts
    posts.where(author_id: id).order(created_at: :desc).limit(3)
  end

  after_create :check_posts_counter

  private

  def check_posts_counter
    user= User.find(id)
    if user.posts_counter == nil
      user.posts_counter = 0
    end
    user.save
  end


end
