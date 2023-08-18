class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  belongs_to :post, foreign_key: :post_id


  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }


  after_create :update_likes_counter

  private

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
