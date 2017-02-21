FactoryGirl.define do
  factory :message do
    title "Fishing for Flounder"
    content "Wonderful fish."
    association :user_id, factory: :user
  end
end
