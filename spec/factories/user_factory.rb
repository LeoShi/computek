# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "123456"
    name "Admin"
    phone "123456"

    factory :admin do
      role "admin"
    end
    factory :dispatcher do
      role "dispatcher"
    end
    factory :control_officer do
      role "control_officer"
    end
  end
end
