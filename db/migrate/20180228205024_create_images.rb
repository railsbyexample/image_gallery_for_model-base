##
# Migration to add images to DB using refile
class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.references :owner, polymorphic: true

      t.string :attached_file_id
      t.string :attached_file_filename
      t.string :attached_file_content_size
      t.string :attached_file_content_type

      t.timestamps
    end
  end
end
