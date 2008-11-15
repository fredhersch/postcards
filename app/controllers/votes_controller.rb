class VotesController < ApplicationController
  def create
    @postcard = Postcard.find(params[:postcard_id])
    @postcard.votes.create
    
    respond_to do |format|
      format.html { redirect_to @postcard }
      format.js
    end
  end
end
