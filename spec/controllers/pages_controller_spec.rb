require 'rails_helper'

describe PagesController, type: :controller do
  describe '#index' do
    it 'renders index' do
      get :index
      expect(response).to render_template(:index)
    end
  end
describe '#random' do
    it 'renders random' do
      get :random
      expect(response).to render_template(:random)
    end
  end
  describe '#about' do
    it 'renders about' do
      get :about
      expect(response).to render_template(:about)
    end
  end
end