require 'rails_helper'

describe 'login' do
  context "as a visitor when I visit / and click login" do
    before :each do
      visit '/'
      click_button "Login"

      @user = User.create(username: 'EL PATRON', name: 'steve', email: 's@mail.com', password: 'password')
      @t_1 = Topic.create(name: 'SpaceX', moderator_id: @user.id)
      @t_2 = Topic.create(name: 'Blue Origin', moderator_id: @user.id)
      FollowedTopic.create!(user: @user, topic: @t_1)
      FollowedTopic.create!(user: @user, topic: @t_2)
    end

    it 'I am redirected to login page' do
      expect(current_path).to eq(login_path)
    end

    it 'I am redirected to dashboard on successful login and see my favorited topics' do
      fill_in :username, with: "#{@user.username}"
      fill_in :password, with: "#{@user.password}"
      click_button "Login"
      expect(current_path).to eq(dashboard_path)
      save_and_open_page
      expect(page).to have_content("You're logged in")
      expect(page).to have_content("Topics you follow")
      expect(page).to have_content("#{@t_1.name}")
      expect(page).to have_content("#{@t_2.name}")

      expect(page).to have_css(".latest")
      expect(page).to have_css(".article")
    end
  end
end
