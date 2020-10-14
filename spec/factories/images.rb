FactoryBot.define do
  
  factory :image do
    src { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test.png')) }
  end

end