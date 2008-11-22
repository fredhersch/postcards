class PostcardsController < ApplicationController
  # GET /postcards
  # GET /postcards.xml
  include AuthenticatedSystem
  include TagsHelper
  
  # uses_tiny_mce
  before_filter :login_required, :only => [:new, :update]
  require_role :admin, :only => [:delete]
  uses_tiny_mce :only => [:new, :create, :edit, :update]
  uses_tiny_mce :options => {
    :theme => "advanced",
    :theme_advanced_buttons1 => "formatselect, bold,italic,underline, strikethrough, separator, bullist, numlist, separator,justifyleft, justifycenter,justifyright,justifyfull,separator,cut, copy, paste, undo, redo, cleanup, removeformat, separator, help",
    :theme_advanced_buttons2 => "",
    :theme_advanced_buttons3 => "",
    :theme_advanced_blockformats => "p,h1,h2,h3,blockquote",
    :theme_advanced_toolbar_location => "top",
    :theme_advanced_toolbar_align => "left",
    :width => "600",
    :height => "200"                            
  }
  #auto_complete_for :postcard, :organisation
   
  def tag_cloud
    @tags = Postcard.tag_counts
  end
      
  def index
    #@count = Postcard.find(:all, :conditions => 'approved = 1').size
    @postcards = Postcard.search(params[:search], params[:page])
    #@postcards = Postcard.paginate :all, :page => params[:page], :order => 'updated_at DESC'
    # @approved = '1'
    # @postcards = Postcard.find(:all, :order => 'id DESC', :conditions => ['approved = ?', @approved], :limit => 5)
    # @tags = Postcard.tag_counts

    respond_to do |format|
      if params[:search]
        format.html { redirect_to(postcards_path)}
      else
        format.html # index.html.erb
        format.xml  { render :xml => @postcards }
      end
    end
  end
  
  def list
    @count = Postcard.find(:all, :conditions => 'approved = 1').size
    @postcards = Postcard.search(params[:search], params[:page])
    
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
    1.times { @postcard.links.build }
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
    @postcard = Postcard.create(params[:postcard])

    respond_to do |format|
      if @postcard.save
        flash[:notice] = 'Postcard was successfully created. The administrator will review your submission and it will be available once it is approved'
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
    @postcard_delete_photo = !params[:postcard].delete(:delete_photo).to_i.zero?
    params[:postcard][:photo] = nil if params[:postcard][:photo].blank? && @postcard_delete_photo
    
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
      
  def about
    # placeholder for the about page
  end
          
end
