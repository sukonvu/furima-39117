FactoryBot.define do
  factory :user do
    nick_name             { 'test' }
    email                 { 'test@example.com' }
    password              { '000000' }
    password_confirmation { '000000' }
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
    birthday              { Date.new(1991, 9, 5) }
  end
end