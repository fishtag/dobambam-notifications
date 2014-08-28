FactoryGirl.define do
  factory :endpoint do
    repost_url { Faker::Internet.url }
  end
end
