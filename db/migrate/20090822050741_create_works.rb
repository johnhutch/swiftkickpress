class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer :category_id
      t.string :title
      t.text :body
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
