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
puts 'CREATED ADMIN USER: ' << admin.username

#
# Other users
#

alice = User.create(
  username: 'alice',
  first_name: 'Alice',
  last_name: 'Example',
  email: 'alice.example@example.com',
  password: 'alice',
  password_confirmation: 'alice'
)
bob = User.create(
  username: 'bob',
  first_name: 'Bob',
  last_name: 'Example',
  email: 'bob.example@example.com',
  password: 'bob',
  password_confirmation: 'bob'
)
chuck = User.create(
  username: 'chuck',
  first_name: 'Chuck',
  last_name: 'Chuckles',
  email: 'chuck.chuckles@example.com',
  password: 'chuck',
  password_confirmation: 'chuck'
)
#
# Activity
#

Activity.create(
  title: "Walking around the lake",
  description: "Who would like to join me for a walk around Trummen lake next Sunday?",
  when: Time.now + 3.weeks,
  author: alice
)

Activity.create(
  title: "Looking for chess partner",
  description: "I'd be interested in playing a game of chess every week. We could meet at my place.",
  when: Time.now + 2.weeks,
  author: bob
)
