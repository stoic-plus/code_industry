require 'rails_helper'

describe Comment, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
    it {should validate_presence_of(:author)}
  end

  describe 'relationships' do
    it {should belong_to(:post)}
    it {should belong_to(:user)}
  end
end
