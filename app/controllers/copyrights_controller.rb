class CopyrightsController < ApplicationController
  # GET /copyrights
  # GET /copyrights.xml
  def index
    @copyrights = Copyright.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @copyrights }
    end
  end

  # GET /copyrights/1
  # GET /copyrights/1.xml
  def show
    @copyright = Copyright.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @copyright }
    end
  end

  # GET /copyrights/new
  # GET /copyrights/new.xml
  def new
    @copyright = Copyright.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @copyright }
    end
  end

  # GET /copyrights/1/edit
  def edit
    @copyright = Copyright.find(params[:id])
  end

  # POST /copyrights
  # POST /copyrights.xml
  def create
    @copyright = Copyright.new(params[:copyright])

    respond_to do |format|
      if @copyright.save
        flash[:notice] = 'Copyright was successfully created.'
        format.html { redirect_to(@copyright) }
        format.xml  { render :xml => @copyright, :status => :created, :location => @copyright }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @copyright.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /copyrights/1
  # PUT /copyrights/1.xml
  def update
    @copyright = Copyright.find(params[:id])

    respond_to do |format|
      if @copyright.update_attributes(params[:copyright])
        flash[:notice] = 'Copyright was successfully updated.'
        format.html { redirect_to(@copyright) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @copyright.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /copyrights/1
  # DELETE /copyrights/1.xml
  def destroy
    @copyright = Copyright.find(params[:id])
    @copyright.destroy

    respond_to do |format|
      format.html { redirect_to(copyrights_url) }
      format.xml  { head :ok }
    end
  end
end
