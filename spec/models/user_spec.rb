require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it {should have_secure_password}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'relationships' do
    it {should have_many(:articles).through(:favorited_articles)}
    it {should have_many(:topics).through(:followed_topics)}
  end
end
