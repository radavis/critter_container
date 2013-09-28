# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username 'baby_elephant_lover'  
    email 'iloveelephants@gmail.com'
    password '87654321'
    password_confirmation '87654321'
  end
end
