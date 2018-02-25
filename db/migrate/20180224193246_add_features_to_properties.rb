##
# Migration to add a `features` array to properties
class AddFeaturesToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :features, :json, array: true, default: []
  end
end
