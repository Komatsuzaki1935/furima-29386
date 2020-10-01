FactoryBot.define do
  factory :user do
    id                  {"10000"}
    nickname            {"tester"}
    email               {"tester@test.com"}
    encrypted_password  {"123abc"}
    first_name          {"予行"}
    last_name           {"演習"}
    furigana_first_name {"ヨコウ"}
    furigana_last_name  {"エンシュウ"}
    birthday            {"2000-04-01"}
  end
end