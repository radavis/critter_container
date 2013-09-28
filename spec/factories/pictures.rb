# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title: 'Cat'
    image: 'http://placedog.com/300/400'
  end
end
