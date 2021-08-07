FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        username { Faker::Internet.username }
        email { Faker::Internet.email }
        password { 'Password1'}
        password_confirmation { 'Password1' }
    end
end