FactoryBot.define do
  factory :user do
    nickname              {"tanaka"}
    email                 {"tanaka@tanaka.com"}
    password              {"00000a"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    last_name_kana        {"タナカ"}
    first_name_kana       {"タロウ"}
    birth_date            {"1930-01-01"}
  end
end
