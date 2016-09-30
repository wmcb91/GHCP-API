# This file should contain all the record creation needed to experiment with
# your app during development.
#
# The data can then be loaded with the rake db:examples (or created alongside
# the db with db:nuke_pave).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(antony jeff matt jason).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'abc123',
               password_confirmation: nil)
end

Profile.create([
                 { given_name: 'alice',
                   surname: 'cooper',
                   dob: '1992-01-02',
                   state: 'massachusetts' },
                 { given_name: 'wilbo',
                   surname: 'cranks',
                   dob: '1993-01-02',
                   state: 'florida' },
                 { given_name: 'tiger',
                   surname: 'woods',
                   dob: '1977-01-02',
                   state: 'california' }
               ])

Round.create([
               { course: 'butter brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 90,
                 profile_id: 1 },
               { course: 'butter brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 87,
                 profile_id: 1 },
               { course: 'butter brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 86,
                 profile_id: 1 },
               { course: 'butter brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 66,
                 profile_id: 3 },
               { course: 'butter brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 68,
                 profile_id: 3 }
             ])
