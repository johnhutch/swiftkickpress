class CreateCopyrights < ActiveRecord::Migration
  def self.up
    create_table :copyrights do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :copyrights
  end
end
