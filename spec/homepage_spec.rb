require 'rails_helper'

describe 'homepage' do
  # I see a short description of the application
  # I see a list of companies as buttons
  # I see an explanation that buttons are to follow companies
  before :each do
    moderator = User.create(username: 'EL PATRON', name: 'steve', email: 's@mail.com', password: 'password', moderator: true)
    @t_1 = Topic.create(name: 'SpaceX', moderator_id: moderator.id)
    @t_2 = Topic.create(name: 'Blue Origin', moderator_id: moderator.id)
    @t_3 = Topic.create(name: 'Virgin Galactic', moderator_id: moderator.id)
  end
  it 'shows a description, a list of topics to follow and an explanation for that feature' do
    visit '/'
    expect(page).to have_content("Welcome to ScienceFollow")
    expect(page).to have_button(@t_1.name)
    expect(page).to have_button(@t_2.name)
    expect(page).to have_button(@t_3.name)
    expect(page).to have_content("Click a topic to follow it")
  end
end
