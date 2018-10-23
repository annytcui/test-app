class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :gender_cd, :integer
  end

  def self.down
    remove_column :users, :gender_cd
  end
end
