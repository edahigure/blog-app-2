require 'rails_helper'

RSpec.describe 'Post index Page', type: :feature do
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

  let!(:comment1) do
    Comment.create(post: post1, author: user, text: 'comment-1!')
  end
  let!(:comment2) do
    Comment.create(post: post1, author: user, text: 'comment-2!')
  end
  let!(:comment3) do
    Comment.create(post: post1, author: user, text: 'comment-3!')
  end

  let!(:comment4) do
    Comment.create(post: post1, author: user, text: 'comment-4!')
  end

  let!(:comment5) do
    Comment.create(post: post1, author: user, text: 'comment-5!')
  end

  before do
    visit user_posts_path(user)
  end

  describe 'user show page ' do
    it 'can show the right content' do
      expect(page).to have_content('This is posts page index ..')
    end

    it 'can see the photo of user' do
      find("img[src='#{user.photo}']")
    end

    it 'can see the name for user' do
      expect(page).to have_content(user.name)
    end

    it 'can see the post number for user one' do
      expect(page).to have_content("number of posts: #{user.posts_counter}")
    end

    it 'can see a post\'s title' do
      posts = Post.where(author_id: user.id)
      posts.each do |post|
        expect(page).to have_content(post.title)
      end
    end

    it 'I can see some of the post\'s body' do
      expect(page).to have_content(post1.text)
      expect(page).to have_content(post2.text)
      expect(page).to have_content(post3.text)
    end

    it 'can see the first comments on a post.' do
      comments = post1.recent_comments
      comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end

    it 'can see how many comments a post has.' do
      posts = Post.where(author_id: user.id)
      posts.each do |post|
        expect(page).to have_content(post.title).and have_content("comments: #{post.comments_counter}")
      end
    end

    it 'can see how many likes a post has.' do
      posts = Post.where(author_id: user.id)
      posts.each do |post|
        expect(page).to have_content(post.title).and have_content("Likes : #{post.likes_counter}")
      end
    end

    it 'can see a button pagination' do
      expect(page).to have_selector(:link_or_button, 'Pagination')
    end

    it 'redirects me to that post\'s show page, When I click a posts\'s title ' do
      first_post = user.recent_posts.first
      find("a[href='#{user_post_path(user.id, first_post.id)}']").click
      expect(page).to have_current_path(user_post_path(user, first_post))
    end
  end
end
