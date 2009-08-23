class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    
    #create base categories
    Category.create do |u| u.name = 'Fiction' end
    Category.create do |u| u.name = 'Nonfiction' end
    Category.create do |u| u.name = 'Comics' end
    Category.create do |u| u.name = 'Poetry' end      
  end

  def self.down
    drop_table :categories
  end
  
end
