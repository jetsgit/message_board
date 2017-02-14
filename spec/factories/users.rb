FactoryGirl.define do
  factory :user do
    first_name "FactoryGirlUser"
    last_name "Doe"
    description "MyDescription"
    sequence(:email) {|n| "person#{n}@example.com" }
    password "pass1word"  
  end
end
