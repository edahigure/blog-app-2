require 'rails_helper'

RSpec.describe Comment, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)

  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                           likes_counter: 0)

  subject { Comment.create(author: first_user, post: first_post, text: 'Hi Tom -1!') }

  before { subject.save }

  it 'comments counter should be 1' do
    expect(first_post.comments_counter).to eq 1
  end

  it 'text should be present' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
