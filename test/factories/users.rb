FactoryGirl.define do
  factory :user do
    first_name   'roger'
    last_name 'dodger'
    email 'r@d.com'
    admin false
    password  'password'
    password_confirmation 'password'
  end
end
