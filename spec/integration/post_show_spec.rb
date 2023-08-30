require 'rails_helper'

RSpec.describe 'Integration specs', type: :feature do
  fixtures :all
  let!(:user) { users(:one) }
  let!(:post1) do
    Post.create(author: user, title: 'Hello-1', text: 'This is my first post')
  end
  let!(:post2) do
    Post.create(author: user, title: 'Hello-2', text: 'This is my second post')
  end

  let!(:post3) do
    Post.create(author: user, title: 'Hello-3', text: 'This is my third post')
  end

  let!(:post4) do
    Post.create(author: user, title: 'Hello-4', text: 'This is my fourth post')
  end

  before do
    visit user_post_path(user, post1)
  end

  describe 'post show page ' do
    it 'can show the right content' do
      expect(page).to have_content('This is Post page ..')
    end

    it 'can see a post\'s title' do
      expect(page).to have_content("Post: #{post1.title}")
    end

    it 'can see a post\'s author' do
      @users = User.all
      user = @users.find(post1.author_id)
      expect(page).to have_content("by #{user.name}")
    end

    it 'can see how many comments the post has.' do
      expect(page).to have_content(post1.title).and have_content("Comments: #{post1.comments_counter}")
    end

    it 'can see how many likes the post has.' do
      expect(page).to have_content(post1.title).and have_content("likes: #{post1.likes_counter}")
    end

    it 'I can see the post\'s body' do
      expect(page).to have_content(post1.text)
    end

    it 'can see the username of each commentor' do
      users = User.all
      comments = Comment.where(post_id: post1.id)
      comments.each do |comment|
        expect(page).to have_content(users.find(comment.author_id))
      end
    end

    it 'can see the comment each commentor left' do
      User.all
      comments = Comment.where(post_id: post1.id)
      comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
