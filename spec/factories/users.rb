FactoryBot.define do
  factory :user do
    nick_name             { Faker::Internet.user_name }
    email                 { Faker::Internet.unique.email }
    password              { '123qwe' }
    password_confirmation { '123qwe' }
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
    birthday              { Date.new(1991, 9, 5) }
  end
end