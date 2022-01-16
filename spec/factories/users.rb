require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.username { Faker::Internet.username(specifier: 3..10) }
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end
end
