require 'rails_helper'

RSpec.describe User, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)

  Post.create(author: first_user, title: 'Hello-1', text: 'This is my 1 post', comments_counter: 0, likes_counter: 0)
  Post.create(author: first_user, title: 'Hello-2', text: 'This is my 2 post', comments_counter: 0, likes_counter: 0)
  Post.create(author: first_user, title: 'Hello-3', text: 'This is my 3 post', comments_counter: 0, likes_counter: 0)
  Post.create(author: first_user, title: 'Hello-4', text: 'This is my 4 post', comments_counter: 0, likes_counter: 0)

  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 1) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be integer greater than zero' do
    expect(subject).to be_valid
  end

  it 'should return the 3 most recent posts for a given user' do
    expect(first_user.recent_posts.count).to eq(3)
  end
end
