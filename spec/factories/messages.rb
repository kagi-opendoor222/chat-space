FactoryGirl.define do
  factory :message do
    text    Faker::Lorem.sentence(3)
    image   File.open("#{Rails.root}/public/shibatio.jpg")
    user
    group
  end
end
