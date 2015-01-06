# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#
# Activity
#

Activity.create(
	title: "Walking around the lake",
	description: "Who would like to join me for a walk around Trummen lake next Sunday?",
	when: Time.now + 3.weeks
)

Activity.create(
	title: "Looking for chess partner",
	description: "I'd be interested in playing a game of chess every week. We could meet at my place.",
	when: Time.now + 2.weeks
)
