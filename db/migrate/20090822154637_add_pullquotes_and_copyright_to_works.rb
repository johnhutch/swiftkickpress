class AddPullquotesAndCopyrightToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :pullquote, :text
    add_column :works, :copyright_id, :integer
  end

  def self.down
    remove_column :works, :copyright_id
    remove_column :works, :pullquote
  end
end
