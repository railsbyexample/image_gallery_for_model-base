##
# Adds an association to an owning resource to properties
class AddOwnerToProperties < ActiveRecord::Migration[5.1]
  def change
    add_reference :properties, :owner, polymorphic: true
  end
end
