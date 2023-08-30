require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  def setup
    @one = users :one
    @two = users :two
  end

  test 'user index can see the username of all other users' do
    visit users_path
    assert page.has_content?(@one.name)
    assert page.has_content?(@two.name)
  end

  test 'user index can see the photo of all other users' do
    visit users_path
    find("img[src='#{@one.photo}']")
    find("img[src='#{@two.photo}']")
  end

  test 'user index can see the post number of all other users' do
    visit users_path

    assert page.has_content?(@one.posts_counter)
    assert page.has_content?(@two.posts_counter)
  end

  test 'sample test' do
    visit users_path
    click_link 'Lilly'
    sleep(3)
    assert page.has_content?("This is users page #{@one.id}")
  end
end
