require 'rails_helper'

describe Article, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:author)}
    it {should validate_presence_of(:source)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:url)}
    it {should validate_presence_of(:url_to_image)}
    it {should validate_presence_of(:published_at)}
    it {should validate_presence_of(:context)}
  end
end
