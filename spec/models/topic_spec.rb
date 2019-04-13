require 'rails_helper'

describe Topic, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it {should belong_to(:user).with_foreign_key('moderator_id')}
  end
end
