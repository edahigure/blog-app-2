# spec/request/users_request_spec.rb

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1'

      expect(response.status).to eq(200)

      expect(response).to render_template('show')

      expect(response.body).to include('This is users page 1')
    end
  end
end
