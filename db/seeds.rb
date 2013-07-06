# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Challenge.delete_all
Participation.delete_all

u = User.create(humanapi_token: "#{Time.now.to_s}", email: "#{Time.now.to_s}", name: "#{Time.now.to_s}")
u2 = User.create(humanapi_token: "#{Time.now.to_s} parti", email: "#{Time.now.to_s} parti", name: "#{Time.now.to_s} Participant")
c = u.created_challenges.create(activity_type: "dfs", )

p u
p c

u2.participating_challenges << c

