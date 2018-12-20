FactoryBot.define do
  factory :article do
    subject { Faker::Book.title }
    catagory { Faker::Types.rb_string }
    description { Faker::Lorem.sentence }
  end
end
