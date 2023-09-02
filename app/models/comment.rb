class Comment < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, foreign_key: :post_id

  after_create :update_comments_counter

  validates :text, presence: true, length: { maximum: 250 }

  after_destroy :decrease_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end

  def decrease_comments_counter
    post = Post.find(post_id)
    post.comments_counter = post.comments_counter - 1
    post.save
  end
end
