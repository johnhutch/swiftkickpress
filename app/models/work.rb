class Work < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  belongs_to :category
  
  validates_presence_of :category_id, :title, :body, :user_id

  
  def score
    sql = "SELECT COUNT(*) " +
      "FROM votes v " +
      "JOIN roles_users r " +
      "USING (user_id)" +
      "WHERE v.work_id=" + self.id.to_s
    
    Work.find_by_sql(sql)
  end

end
