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
    visit user_path(user)
  end

  describe 'user show page ' do
    it 'can show the right content' do
      expect(page).to have_content('This is users page Lilly')
    end

    it 'can see the photo of all other users' do
      find("img[src='#{user.photo}']")
    end

    it 'can see the post number for user one' do
      expect(page).to have_content(user.posts_counter)
    end

    it 'can see the user one bio.' do
      expect(page).to have_content(user.bio)
    end

    it 'can see the user first three posts' do
      last_post = user.recent_posts
      last_post.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'can see a button that lets me view all of a user\'s posts' do
      expect(page).to have_selector(:link_or_button, 'See all posts')
    end

    it "When I click to see all posts, it redirects me to the user's post's index page" do
      click_on 'See all posts'
      expect(current_path).to eq(user_posts_path(user))
    end

    it 'redirects me to that post\'s show page, When I click a user\'s post ' do
      first_post = user.recent_posts.first
      find("a[href='#{user_post_path(user.id, first_post.id)}']").click
      expect(page).to have_current_path(user_post_path(user, first_post))
    end
  end
end
