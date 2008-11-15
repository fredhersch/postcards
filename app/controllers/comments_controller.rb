class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  
  def index
    @comments = Comment.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # POST /comments
  # POST /comments.xml
  def create
    @commment = Comment.create(params[:comment])
    flash[:notice] = 'Comment was successfully created.'    
    respond_to do |format|
      format.html { redirect_to @postcard }
      format.js
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
          
end
