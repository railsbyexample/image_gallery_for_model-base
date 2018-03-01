FactoryBot.define do
  factory :image do
    owner { create :property }
    attached_file_id 'MyString'
    attached_file_filename 'MyString'
    attached_file_content_size 'MyString'
    attached_file_content_type 'MyString'
  end
end
