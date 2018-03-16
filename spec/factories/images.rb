FactoryBot.define do
  factory :image do
    owner { create :property }

    sequence(:attached_file) do |n|
      Refile::FileDouble.new("test-#{n}", "test-#{n}.png", content_type: 'image/png')
    end
  end
end
