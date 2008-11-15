class TagsController < ApplicationController
  def show
    @postcards = Postcard.find_tagged_with(params[:id])
  end
  
  def index
    @tags = Tag.find(:all, :conditions => ['name LIKE ?', "%#{params[:postcard][:tag_list]}%"])
  end
  
end
