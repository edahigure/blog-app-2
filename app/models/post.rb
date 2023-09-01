class Post < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, allow_nil: true, numericality: { greater_than_or_equal_to: 0 }

  after_create do
    increase_posts_counter
    check_comments_counter
    check_likes_counter
  end

  after_destroy :decrease_posts_counter

  def recent_comments
    comments.where(post_id: id).limit(5).order(created_at: :desc)
  end

  private

  def increase_posts_counter
    author.increment!(:posts_counter)
  end

  def decrease_posts_counter
    user = User.find(author_id)
    user.posts_counter = user.posts_counter - 1
    user.save
  end

  def check_comments_counter
    post = Post.find(id)
    post.comments_counter = 0 if post.comments_counter.nil?
    post.save
  end

  def check_likes_counter
    post = Post.find(id)
    post.likes_counter = 0 if post.likes_counter.nil?
    post.save
  end
end
