FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"2084taku"}
    password_confirmation {"2084taku"}
    first_name            {"池田"}
    last_name             {"匠"}
    first_name_kana       {"イケダ"}
    last_name_kana        {"タクミ"}
    birthday              {"1997-1-14"}
  end

end
