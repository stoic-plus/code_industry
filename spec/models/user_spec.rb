require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should have_secure_password}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should have_many(:articles).through(:user_articles)}
    it {should have_many(:topics).through(:followed_topics)}
  end
end
