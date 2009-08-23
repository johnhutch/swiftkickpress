class ContentController < ApplicationController
  
  require_role "admin", :only => :admin
  require_role "editor", :only => :editor
  
  def about
  end
  
  def front
    render :layout => "front"
  end
  
  def contact
  end
  
  def editor
    @works = Work.paginate :per_page => 20, :page => params[:page], :order => "created_at DESC"
  end
  
  def admin
    @works = Work.find(:all, :order => "created_at DESC")
    @users = User.find(:all, :order => "created_at DESC")
    @categories = Category.find(:all, :order => "created_at DESC")
  end
  
end
