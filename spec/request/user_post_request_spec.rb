# spec/request/user_post_request_spec.rb

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before { get '/users/1/posts' }
    it 'returns http success' do
      expect(response.status).to eq(200)
    end
    it 'renders the correct template' do
      expect(response).to render_template('index')
    end
    it 'renders the correct placeholder text' do
      expect(response.body).to include('This is posts page index')
    end
  end

  describe 'GET /show' do
    before { get '/users/1/posts/1' }

    it 'returns http success' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template('show')
    end

    it 'renders the correct placeholder text' do
      expect(response.body).to include('This is Post page 1')
    end
  end
end
