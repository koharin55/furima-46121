FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"陸太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"リクタロウ"}
    birthday {Faker::Date.between(from: '1930-01-01', to: '2020-12-31')}
  end
end
