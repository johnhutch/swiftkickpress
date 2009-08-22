class ContentController < ApplicationController
  
  def about
  end
  
  def front
    render :layout => "front"
  end
  
  def contact
  end
  
  def admin
    @works = Work.find(:all, :order => "created_at DESC")
    @users = Users.find(:all, :order => "created_at DESC")
    @categories = Categories.find(:all, :order => "created_at DESC")
    @copyrights = Copyrights.find(:all, :order => "created_at DESC")
  end
  
end
