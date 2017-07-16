require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe '#index' do
    it 'renders post index page' do
      get :index
      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'renders index template' do
        post :create, post: { body: "Sunny rocks" }
        expect(response).to render_template('index')
      end
    end
    context 'with invalid params' do
      it 'renders new template + provides errors' do
        post :create, post: { body: "rocks" }
        expect(response).to render_template('new')
        expect(flash[:sign_up_error]).to be_present
      end
    end
  end

  describe '#destroy' do
    context 'existing post' do
      let (:post) { FactoryGirl.create(:post) }

      it 'removes post from table' do
        expect { delete :destroy, id: post }.to change { Post.count }.by(-1)
      end

      it 'renders index template' do
        delete :destroy, id: post
        expect(response).to render_template('index')
      end
    end

    context 'delete a non-existent post' do
      it 'creates an error message' do
        delete :destroy, id: 10000
        expect(flash[:errors]).to include("Post doesn't exist")
      end
    end
  end
end
