require 'rails_helper'

describe 'Favoriting a topic' do
  context 'as a logged in user - when I click a topic' do
    before :each do
      @user = User.create(username: 'EL PATRON', name: 'steve', email: 's@mail.com', password: 'password')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @t_1 = Topic.create(name: 'SpaceX', moderator_id: @user.id)
      @t_2 = Topic.create(name: 'Blue Origin', moderator_id: @user.id)

      visit '/'
      click_button "#{@t_2.name}"
    end
    it 'the picked topic is added to my topics' do
      expect(@user.topics.count).to eq(1)
      expect(@user.topics.first).to eq(@t_2)
    end
    it 'I am redirected to show page and I see a message indicating that I followed the topic' do
      expect(current_path).to eq(topic_path(@t_2.id))
      expect(page).to have_content("#{@t_2.name} has been added to your favorited topics")
    end
  end
end
