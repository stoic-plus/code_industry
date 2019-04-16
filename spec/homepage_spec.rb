require 'rails_helper'

describe 'homepage' do
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
    expect(page).to have_content("Click a topic below to follow it")
  end
  it 'redirects to that topics page after following' do
    visit '/'
    click_on "#{@t_1.name}"
    expect(current_path).to eq(topic_path(@t_1.id))
    expect(page).to have_content("#{@t_1.name}")
  end
end
