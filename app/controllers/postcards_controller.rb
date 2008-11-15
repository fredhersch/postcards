class PostcardsController < ApplicationController
  # GET /postcards
  # GET /postcards.xml
  include AuthenticatedSystem
  include TagsHelper
  
  # uses_tiny_mce
  before_filter :login_required, :only => [:new, :update]
  require_role :admin, :only => :delete
  uses_tiny_mce :only => [:new, :create, :edit, :update]
   
  def tag_cloud
    @tags = Postcard.tag_counts
  end
      
  def index
    #@postcards = Postcard.find(:all)
    @postcards = Postcard.search(params[:search], params[:page])
    #@postcards = Postcard.paginate :all, :page => params[:page], :order => 'updated_at DESC'

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

  # GET /postcards/new
  # GET /postcards/new.xml
  def new
    @postcard = Postcard.new
    @selected_country = "Australia"
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @postcard }
    end
  end

  # GET /postcards/1/edit
  def edit
    @postcard = Postcard.find(params[:id])
  end

  # POST /postcards
  # POST /postcards.xml
  def create
    #@postcard = @current_user.postcards.build params[:postcard]   
    @postcard = Postcard.create(params[:postcard])

    respond_to do |format|
      if @postcard.save
        flash[:notice] = 'Postcard was successfully created.'
        format.html { redirect_to(postcards_path) }
        format.xml  { render :xml => @postcard, :status => :created, :location => @postcard }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @postcard.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /postcards/1
  # PUT /postcards/1.xml
  def update
    @postcard = Postcard.find(params[:id])

    respond_to do |format|
      if @postcard.update_attributes(params[:postcard])
        flash[:notice] = 'Postcard was successfully updated.'
        format.html { redirect_to(@postcard) }
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
      format.html { redirect_to(postcards_url) }
      format.xml  { head :ok }
    end
  end
  
  # DELETE /postcards/1
  # DELETE /postcards/1.xml
  def destroy
    @postcard = Postcard.find(params[:id])
    @postcard.destroy

    respond_to do |format|
      format.html { redirect_to(postcards_url) }
      format.xml  { head :ok }
    end
  end
  
  def latest
    @postcards = Postcard.find :all, :order => 'id DESC', :limit => 5 
    respond_to do |format|
      format.html
      format.xml  { render :xml => @postcards }
    end

  end

  def popular
    @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => 'votes_count' >= 5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @postcards }
    end
  end
        
end
