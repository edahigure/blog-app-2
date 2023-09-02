require 'rails_helper'

RSpec.describe 'User index Page', type: :system do
  fixtures :all

  before do
    @one = users(:one)
    @two = users(:two)
  end

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('Hello, world!')
    end

    it 'user index can see the username of all other users' do
      visit users_path
      expect(page).to have_content('Lilly')
      expect(page).to have_content('Tom')
    end

    it 'user index can see the photo of all other users' do
      visit users_path
      find("img[src='#{@one.photo}']")
      find("img[src='#{@two.photo}']")
    end

    it 'user index can see the post number of all other users' do
      visit users_path

      expect(page).to have_content(@one.posts_counter)
      expect(page).to have_content(@two.posts_counter)
    end

    it 'sample test' do
      visit users_path
      click_link 'Lilly'
      expect(page).to have_content('This is users page Lilly')
    end
  end
end
