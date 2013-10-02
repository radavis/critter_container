# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "baby_elephant_lover#{n}" } 
    sequence(:email) {|n| "iloveelephants#{n}@gmail.com" }
    password '87654321'
    password_confirmation '87654321'
  end
end
