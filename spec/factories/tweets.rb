FactoryBot.define do
    factory :tweet do
        text {Faker::Lorem.paragraph_by_chars(number: 280, supplemental: false)}
        association :user
    end
end