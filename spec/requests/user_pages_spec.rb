require 'rails_helper'

describe 'user pages' do
  subject { page }

  describe 'index' do
    User.destroy_all
    let(:user1) { User.create(name: "Laila Zaki", email: "laila@gmail.com",
                        password: "foobar", password_confirmation: "foobar") }
    let(:user2) { User.create(name: "Marcus Wright", email: "marcus@gmail.com",
                        password: "foobar", password_confirmation: "foobar") }

    before { visit users_path }

    it { should have_title('All Users') }
    it { should have_selector('h1', text: 'All Users') }

    it "lists each user" do
      User.all.each do |user|
        expect(page).to have_selector('li', text: user.id)
      end
    end

    describe 'delete links' do
      let!(:user1) { User.create(name: "Laila Zaki", email: "laila@gmail.com",
                          password: "foobar", password_confirmation: "foobar") }
      let!(:user2) { User.create(name: "Marcus Wright", email: "marcus@gmail.com",
                          password: "foobar", password_confirmation: "foobar") }

      before { visit users_path }
      it { should have_link('delete', href: user_path(User.first)) }

      describe 'after clicking delete' do
        before { click_link('delete', match: :first) }
        it { should_not have_content('Laila Zaki') }
      end
    end
  end

  describe 'show' do
    let(:user) { User.create(name: "Laila Zaki", email: "laila@gmail.com",
                        password: "foobar", password_confirmation: "foobar") }

    before { visit user_path(user.id) }

    it { should have_title(user.name) }
    it { should have_selector('h1', text: user.name) }
  end

  describe 'new user page' do
    before { visit signup_path }

    it { should have_title('Sign Up') }
    it { should have_selector('h1', 'Sign Up') }

    describe 'create user' do
      let(:submit) { 'Save' }

      context 'valid information' do
        before do
          # fill in all necessary info in the fields
          fill_in 'Name',             with: 'Laila Zaki'
          fill_in 'Email',            with: 'laila@gmail.com'
          fill_in 'Password',         with: 'foobar'
          fill_in 'Confirm password', with: 'foobar'
        end

        it 'creates user' do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe 'after saving' do

          before { click_button submit }

          it { should have_title('Laila Zaki') }
        end
      end

      context 'invalid information' do
        it 'does not create user' do
          expect { click_button submit }.not_to change(User, :count)
        end

        describe 'after submission' do
          before { click_button submit }

          it { should have_title('Sign Up') }
          it { should have_content('error') }
        end
      end
    end
  end

  describe 'edit user page' do
    let(:user_for_edit) { User.create(name: "Laila Zaki", email: "laila@gmail.com",
                        password: "foobar", password_confirmation: "foobar") }

    before { visit edit_user_path(user_for_edit.id) }

    it { should have_title('Edit Profile') }
    it { should have_selector('h1', 'Edit Profile') }

    describe 'update user' do
      let(:submit) { 'Save' }

      context 'valid information' do

        before do
          fill_in "Name", with: "Lilac Zucchini"
          click_button submit
        end

        describe 'after saving changes' do
          it { should have_title('Lilac Zucchini') }
          specify { expect(user_for_edit.reload.name).to eq('Lilac Zucchini') }
        end
      end

      context 'invalid information' do
        before do
          fill_in "Name", with: " "
          click_button submit
        end
        describe 'after submission' do
          it { should have_title('Edit Profile') }
          it { should have_content('error') }
        end
      end
    end
  end
end