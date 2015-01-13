# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Admin users
#

admin1 = User.create!(
  role: "admin",
  first_name: ENV['ADMIN_FIRSTNAME'],
  last_name: ENV['ADMIN_LASTNAME'],
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD']
)
admin2 = User.create!(
  role: "admin",
  first_name: ENV['ADMIN2_FIRSTNAME'],
  last_name: ENV['ADMIN2_LASTNAME'],
  email: ENV['ADMIN2_EMAIL'],
  password: ENV['ADMIN2_PASSWORD'],
  password_confirmation: ENV['ADMIN2_PASSWORD']
)
puts "CREATED ADMIN USERS: #{admin1.email}, #{admin2.email}"

#
# Caregivers
#

karl = User.create!(
  role: "caregiver",
  first_name: "Karl",
  last_name: "Karlsson",
  email: "karl.karlsson@example.com",
  password: "karlkarl",
  password_confirmation: "karlkarl"
)
linnea = User.create!(
  role: "caregiver",
  first_name: "Linnea",
  last_name: "Lin",
  email: "linnea.lin@example.com",
  password: "linnealinnea",
  password_confirmation: "linnealinnea"
)

#
# Regular users
#

alice = User.create!(
  role: "care_recipient",
  caregiver: karl,
  first_name: "Alice",
  last_name: "Example",
  email: "alice@example.com",
  password: "alicealice",
  password_confirmation: "alicealice"
)
bob = User.create!(
  role: "care_recipient",
  caregiver: linnea,
  first_name: "Bob",
  last_name: "Example",
  email: "bob@example.com",
  password: "bobbob",
  password_confirmation: "bobbob"
)
chuck = User.create!(
  role: "care_recipient",
  first_name: "Chuck",
  last_name: "Chuckles",
  email: "chuck.chuckles@example.com",
  password: "chuckchuck",
  password_confirmation: "chuckchuck"
)

#
# Activities
#

lake_walk = Activity.create(
  title: "Walking around the lake",
  description: "Who would like to join me for a walk around Trummen lake next Sunday?",
  proposed_time: Time.now + 3.weeks,
  author: alice
)

chess = Activity.create(
  title: "Looking for chess partner",
  description: "I'd be interested in playing a game of chess every week. We could meet at my place.",
  proposed_time: Time.now + 2.weeks,
  author: bob
)

#
# Comments
#

Comment.create(
  commenter: alice,
  activity: chess,
  body: "I would love to play chess with you, but I'm no pro so you'd have to be patient with me. :)"
)

Comment.create(
  commenter: bob,
  activity: lake_walk,
  body: "I'm in! What time should we go and where to meet?"
)

Comment.create(
  commenter: alice,
  activity: lake_walk,
  body: "I thought maybe at 14:00. Let's meet in front of the Netto. Looking forward to it!"
)

Comment.create(
  commenter: chuck,
  activity: lake_walk,
  body: "Can I also join you guys?"
)

Comment.create(
  commenter: alice,
  activity: lake_walk,
  body: "Sure!"
)

#
# Activity participants
#

Participation.create(
  activity: lake_walk,
  user: bob
)

Participation.create(
  activity: lake_walk,
  user: chuck
)

Participation.create(
  activity: chess,
  user: alice
)