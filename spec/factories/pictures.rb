# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    title "MyCat"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'features', 'helveticat.jpg'))
  end
end

