require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe '#index' do
    it 'renders post index page' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end
end
