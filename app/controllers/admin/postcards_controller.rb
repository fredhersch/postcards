class Admin::PostcardsController < ApplicationController
  # GET /postcards
  # GET /postcards.xml
  include AuthenticatedSystem
  include TagsHelper
  
  before_filter :login_required
  require_role :admin
  
  def index
    @count = Postcard.find(:all).size
    #@postcards = Postcard.search(params[:search], params[:page])
    @postcards = Postcard.paginate :all, :page => params[:page],:order => 'approved ASC, updated_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postcards }
    end
  end
  
  # GET /postcards/1
  # GET /postcards/1.xml
  def show
    @postcard = Postcard.find(params[:id])
    @submitted_by = User.find_by_id(@postcard.user_id)
    @tags = Postcard.tag_counts
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @postcard }
    end
  end
  
  # PUT /postcards/1
  # PUT /postcards/1.xml
  def update
    @postcard = Postcard.find(params[:id])

    respond_to do |format|
      if @postcard.update_attributes(params[:postcard])
        flash[:notice] = 'Postcard was successfully updated.'
        format.html { redirect_to(admin_postcards_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @postcard.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /postcards/1
  # DELETE /postcards/1.xml
  def destroy
    @postcard = Postcard.find(params[:id])
    @postcard.destroy

    respond_to do |format|
      format.html { redirect_to(admin_postcards_url) }
      format.xml  { head :ok }
    end
  end
  
end
