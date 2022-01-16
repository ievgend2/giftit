FactoryBot.define do
  factory :post do |f|
    f.title { Faker::Lorem.word }
    f.description { Faker::Lorem.paragraph(sentence_count: 2) }  
    f.image { Rack::Test::UploadedFile.new('spec/support/test_image.jpg') }
    association :user
    association :category

  end
end
