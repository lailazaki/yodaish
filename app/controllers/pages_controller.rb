class PagesController < ApplicationController
  

  def index
    @quote = Page.yoda(params[:quote])
  end

  def random
  	@active = 'random'
  	render :layout => false
  end

  def about
  	@active = 'about'
    render :layout => false
  end

end
