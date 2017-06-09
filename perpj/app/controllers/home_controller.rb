class HomeController < ApplicationController
  def index
  	@papers = Paper.all
  end

  def show
  	@paper = Paper.find(params[:id])

  	unless params["comment"].nil?
  		@new_comment = params["comment"]["new_comment"]
  		@paper.comment = @new_comment
  		@paper.save
  	end
  	
  end
end
