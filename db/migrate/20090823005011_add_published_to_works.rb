class AddPublishedToWorks < ActiveRecord::Migration
  def self.up
    add_column :works, :published, :boolean, :default => false
  end

  def self.down
    remove_column :works, :published
  end
end
