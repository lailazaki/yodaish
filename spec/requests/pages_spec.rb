require 'rails_helper'

describe 'pages' do
  subject { page }

  describe 'home page' do
    before { visit root_path }

    it { should have_title('Yoddish') }
    it { should have_selector('h1', text: 'Yoddish') }
  end

  describe 'about page' do
    before { visit about_path }

    it { should have_title('About Me')}
    it { should have_selector('h1', text: 'Yoddish') }
  end
end