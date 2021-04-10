FactoryBot.define do
  factory :purchase_address do
    postcode   { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipality  { Faker::Address.city }
    address       { Faker::Address.street_name }
    room_name { 'あいうえおアイウエオ亜意于絵尾aioeoAIUEO123456789' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
