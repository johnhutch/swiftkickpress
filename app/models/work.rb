class Work < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  
  validates_presence_of :category_id, :title, :body, :user_id
end
