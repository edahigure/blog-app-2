require 'rails_helper'

RSpec.describe Like, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)

  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)

  subject { Like.create(author: first_user, post: first_post) }

  before { subject.save }

  it 'should have likes_counter equal to one' do
    expect(first_post.likes_counter).to eql 1
  end
end