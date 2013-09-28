# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    #'alias', 'baby_elephant_lover'  # alias is a ruby keyword
    email 'iloveelephants@gmail.com'
    password '87654321'
    password_confirmation '87654321'
  end
end
