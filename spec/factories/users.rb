FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name::first_name  }
    last_name { FFaker::Name::last_name  }
    description "MyDescription"
    email {|u| "#{u.first_name.gsub(/[^a-zA-Z1-10]/, '')}_#{u.last_name.gsub(/[^a-zA-Z1-10]/, '')}_#{Random.rand(1000)}@example.com" }
    password "pass1word"  
  end
end
