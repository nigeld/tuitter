FactoryBot.define do
    factory :tweet do
        text Faker::Twitter.text
        user_id Faker::Twitter.id
    end
end