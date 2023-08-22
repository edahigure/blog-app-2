# spec/request/user_request_spec.rb

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/'

      expect(response.status).to eq(200)

      expect(response).to render_template('index')

      expect(response.body).to include('This is users page index')
    end
  end
end
