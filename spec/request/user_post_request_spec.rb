# spec/request/user_post_request_spec.rb

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts'

      expect(response.status).to eq(200)

      expect(response).to render_template('index')

      expect(response.body).to include('This is posts page index')
    end
  end
end
