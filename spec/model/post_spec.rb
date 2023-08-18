require 'rails_helper'

RSpec.describe Post, type: :model do
  first_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer',
                           posts_counter: 0)

  subject do
    Post.create(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
  end

  before { subject.save }

  it 'name should be present' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be present' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be equal 0' do
    expect(subject.comments_counter).to eql 0
  end

  it 'title should be maximum 50 words' do
    subject.title = 'x' * 255
    expect(subject).to_not be_valid
  end

  it 'likes counter should be present' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end
end
