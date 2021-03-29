FactoryBot.define do
  factory :user do
    
    nickname            {"太郎"}  
    email               {"sample@gmail.com"}          
    last_name           {"太郎"} 
    first_name          {"山田"}
    last_name_kana      {"タロウ"}
    first_name_kana     {"ヤマダ"}
    birthday            {"1996-3-10"}
    password            {""}
  end
end
