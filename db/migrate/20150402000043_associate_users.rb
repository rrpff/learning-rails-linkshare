class AssociateUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true

    add_reference :links, :user, index: true
    add_reference :comments, :user, index: true
  end
end