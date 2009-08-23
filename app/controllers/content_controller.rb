class ContentController < ApplicationController
  
  require_role "admin", :only => :admin
  
  def about
  end
  
  def front
    render :layout => "front"
  end
  
  def contact
  end
  
  def admin
    @works = Work.find(:all, :order => "created_at DESC")
    @users = User.find(:all, :order => "created_at DESC")
    @categories = Category.find(:all, :order => "created_at DESC")
  end
  
end
