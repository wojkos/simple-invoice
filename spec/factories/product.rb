# frozen_string_literal: true

FactoryGirl.define do
  sequence(:name) { |n| "Ruby #{n}" }
  sequence(:code) { |n| "ab#{n}" }

  factory :product do
    name
    code
    price 1.01
  end
end
