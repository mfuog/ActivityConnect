# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Admin user
#

admin = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << admin.email

#
# Other users
#

alice = User.create!(
  role: 'caretaker',
  first_name: 'Alice',
  last_name: 'Example',
  email: 'alice.example@example.com',
  password: 'alicealice',
  password_confirmation: 'alicealice'
)
bob = User.create!(
  role: 'user',
  first_name: 'Bob',
  last_name: 'Example',
  email: 'bob.example@example.com',
  password: 'bobbob',
  password_confirmation: 'bobbob'
)
chuck = User.create!(
  role: 'caretaker',
  first_name: 'Chuck',
  last_name: 'Chuckles',
  email: 'chuck.chuckles@example.com',
  password: 'chuckchuck',
  password_confirmation: 'chuckchuck'
)

#
# Activities
#

lake_walk = Activity.create(
  title: "Walking around the lake",
  description: "Who would like to join me for a walk around Trummen lake next Sunday?",
  when: Time.now + 3.weeks,
  author: alice
)

chess = Activity.create(
  title: "Looking for chess partner",
  description: "I'd be interested in playing a game of chess every week. We could meet at my place.",
  when: Time.now + 2.weeks,
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