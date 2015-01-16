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
  gender: "female",
  address: "Georg Lückligs väg 16, Växjö",
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD']
)
admin2 = User.create!(
  role: "admin",
  first_name: ENV['ADMIN2_FIRSTNAME'],
  last_name: ENV['ADMIN2_LASTNAME'],
  gender: "female",
  email: ENV['ADMIN2_EMAIL'],
  address: "Gamla vägen 7, Växjö",
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
  gender: "male",
  age: "39",
  email: "karl.karlsson@example.com",
  address: "Stallvägen 25, Växjö",
  password: "karlkarl",
  password_confirmation: "karlkarl"
)
linnea = User.create!(
  role: "caregiver",
  first_name: "Linnea",
  last_name: "Lin",
  gender: "female",
  age: "45",
  email: "linnea.lin@example.com",
  address: "Arabygatan 31, Växjö",
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
  gender: "female",
  age: "53",
  interests: "My grandchildren, being outside, going for walks",
  email: "alice@example.com",
  address: "Ramsövägen 26, Växjö",
  password: "alicealice",
  password_confirmation: "alicealice"
)
bob = User.create!(
  role: "care_recipient",
  caregiver: linnea,
  first_name: "Bob",
  last_name: "Example",
  gender: "male",
  age: "68",
  interests: "Reading, repairing stuff, playing chess and other board games",
  email: "bob@example.com",
  address: "Lindögatan 4, Växjö",
  password: "bobbob",
  password_confirmation: "bobbob"
)
chuck = User.create!(
  role: "care_recipient",
  first_name: "Chuck",
  last_name: "Chuckles",
  gender: "male",
  age: "72",
  interests: "I'm interested in nature, wildlife, plants and photagraphy.",
  email: "chuck.chuckles@example.com",
  address: "Hästskovägen 9, Växjö",
  password: "chuckchuck",
  password_confirmation: "chuckchuck"
)
john = User.create!(
  role: "care_recipient",
  first_name: "John",
  last_name: "Johansen",
  gender: "male",
  age: "65",
  interests: "I like being outdoors, and playing chess. I have a dog.",
  email: "john.johansen@example.com",
  address: "Röjningsvägen 9, 352 51 Växjö, Sweden",
  password: "johnjohn",
  password_confirmation: "johnjohn"
)
alex = User.create!(
  role: "care_recipient",
  first_name: "Alex",
  last_name: "Atkinson",
  gender: "male",
  age: "69",
  interests: "I play the trumpet and the accordion. Would be nice to keep up playing. I also like cooking.",
  email: "alex.atkinson@example.com",
  address: "Lusthusgatan 1, 352 59 Växjö, Sweden",
  password: "alexalex",
  password_confirmation: "alexalex"
)
lisa = User.create!(
  role: "care_recipient",
  first_name: "Lisa",
  last_name: "Larson",
  gender: "female",
  age: "73",
  interests: "I enjoy cooking and doing handy crafts. In the summer I like to garden.",
  email: "lisa.larson@example.com",
  address: "Johan Allgulins väg 5, 352 57 Växjö, Sweden",
  password: "lisalisa",
  password_confirmation: "lisalisa"
)

#
# Activities
#

lake_walk = Activity.create(
  title: "Walking around the lake",
  description: "Who would like to join me for a walk around Trummen lake next Sunday?",
  proposed_time: Time.now + 3.weeks,
  address: "J F Liedholms väg 14, Växjö",
  author: alice
)

chess = Activity.create(
  title: "Looking for chess partner",
  description: "I'd be interested in playing a game of chess every week. We could meet at my place.",
  proposed_time: Time.now + 2.weeks,
  address: bob.address,
  author: bob
)

bingo = Activity.create(
  title: "Let's play bingo!",
  description: "There is a bingo night at the Vaxjo Community Center at 5pm tomorrow. Let's have more people attend this time. I go every few weeks, but it would be nice to meet more people there.",
  proposed_time: Time.now + 2.weeks,
  address: chuck.address,
  author: chuck
)

fika = Activity.create(
  title: "Stroll in Vaxjo with fika afterwards",
  description: "We will meet at the fountain downtown at 11am and go for a leisurely walk around the lake. If the weather is nice bring a book and we will sit down to read and chat outside afterwards.",
  proposed_time: Time.now + 2.weeks,
  address: bob.address,
  author: bob
)

shopping = Activity.create(
  title: "Shopping at Willy's",
  description: "I'm taking the bust to Willy's Supermarket on Saturday the 8th at 3pm from Resecentrum. Who wants to join me? Fika afterwards :)",
  proposed_time: Time.now + 2.weeks,
  address: alex.address,
  author: alex
)

lucia = Activity.create(
  title: "Lucia Event in Vaxjo",
  description: "There is a Lucia Event at the Church at 8pm on December 6th. I'm looking for 1 - 3 people to join me. Time to get in a Christmas mood! Comment if you would be interested. I also suggest those who have time join me for dinner at Rosegarden at 6:30pm before walking to the church.",
  proposed_time: Time.now + 2.weeks,
  address: alice.address,
  author: alice
)

cooking = Activity.create(
  title: "Let's cook Italian this weekend",
  description: "I have an italian cookbook with great recipes and delicious pictures. Would be more fun to cook together. I'm looking for 1 - 2 people to join me. Comment below if you're interested. I'll provide all ingredients.",
  proposed_time: Time.now + 2.weeks,
  address: lisa.address,
  author: lisa
)

#
# Comments
#

Comment.create!(
  commenter: alice,
  activity: chess,
  body: "I would love to play chess with you, but I'm no pro so you'd have to be patient with me. :)"
)

Comment.create!(
  commenter: bob,
  activity: lake_walk,
  body: "I'm in! What time should we go and where to meet?"
)

Comment.create!(
  commenter: alice,
  activity: lake_walk,
  body: "I thought maybe at 14:00. Let's meet in front of the Netto. Looking forward to it!"
)

Comment.create!(
  commenter: chuck,
  activity: lake_walk,
  body: "Can I also join you guys?"
)

Comment.create!(
  commenter: alice,
  activity: lake_walk,
  body: "Sure!"
)

Comment.create!(
  commenter: chuck,
  activity: fika,
  body: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam " \
        "nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam " \
        "erat, sed diam voluptua. At vero eos et accusam et justo duo dolores " \
        "et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est " \
        "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur " \
        "sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore " \
        "et dolore magna aliquyam erat, sed diam voluptua. At vero eos et " \
        "accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, " \
        "no sea takimata sanctus est Lorem ipsum dolor sit amet."
)

#
# Activity participants
#

Participation.create!(
  activity: lake_walk,
  user: bob
)

Participation.create!(
  activity: lake_walk,
  user: chuck
)

Participation.create!(
  activity: chess,
  user: alice
)
