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

%w(antony jeff matt tiger).each do |name|
  email = "#{name}@#{name}.com"
  next if User.exists? email: email
  User.create!(email: email,
               password: 'abc123',
               password_confirmation: nil)
end

Profile.create([
                 { given_name: 'Antony',
                   surname: 'Cranks',
                   dob: '1992-01-02',
                   user_id: 1,
                   state: 'Massachusetts' },
                 { given_name: 'Wilbo',
                   surname: 'Cranks',
                   dob: '1993-01-02',
                   user_id: 1,
                   state: 'Florida' },
                 { given_name: 'Tiger',
                   surname: 'Woods',
                   dob: '1977-01-02',
                   user_id: 4,
                   state: 'California' },
                 { given_name: 'Jeff',
                   surname: 'Bridges',
                   dob: '1967-01-02',
                   user_id: 2,
                   state: 'California' },
                 { given_name: 'Matt',
                   surname: 'Damon',
                   dob: '1979-01-02',
                   user_id: 3,
                   state: 'Massachusetts' }
               ])

Round.create([
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 90,
                 profile_id: 1 },
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 87,
                 profile_id: 1 },
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 86,
                 profile_id: 1 },
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 66,
                 profile_id: 3 },
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 68,
                 profile_id: 3 },
               { course: 'Butter Brook',
                 date: '2016-09-29',
                 rating: 72.5,
                 slope: 133,
                 par: 72,
                 score: 69,
                 profile_id: 2 }
             ])
