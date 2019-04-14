Topic.destroy_all
User.destroy_all
Article.destroy_all
FavoritedArticle.destroy_all
FollowedTopic.destroy_all
Post.destroy_all
Comment.destroy_all

moderator = User.create!(username: 'EL PATRON', name: 'steve', email: 's@mail.com', password: 'password', moderator: true)
Topic.create!(name: 'SpaceX', moderator_id: moderator.id)
Topic.create!(name: 'Blue Origin', moderator_id: moderator.id)
Topic.create!(name: 'Virgin Galactic', moderator_id: moderator.id)
Topic.create!(name: 'United Launch Alliance', moderator_id: moderator.id)
Topic.create!(name: 'NASA', moderator_id: moderator.id)

Topic.create!(name: 'Moon Base', moderator_id: moderator.id)
Topic.create!(name: 'Mars', moderator_id: moderator.id)
Topic.create!(name: 'Black Hole', moderator_id: moderator.id)

Topic.create!(name: 'International Space Station', moderator_id: moderator.id)
Topic.create!(name: 'Parker Solar Probe', moderator_id: moderator.id)
Topic.create!(name: 'Opportunity', moderator_id: moderator.id)
