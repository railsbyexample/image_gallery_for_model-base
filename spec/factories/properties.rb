FactoryBot.define do
  factory :property do
    owner { create :user }

    title 'MyString'
  end
end
