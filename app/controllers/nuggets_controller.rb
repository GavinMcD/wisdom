class NuggetsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  def create
    @nugget = current_user.nuggets.build(params[:nugget])
    if @nugget.save
      redirect_to root_path, :notice => "Your advice is now passed on to others"
    else
      redirect_to root_path, :notice => "Make sure your advice is sound"
    end
  end
  
  def destroy
    @nugget = current_user.nuggets.find(params[:id])
    # ask someone if I need these lines...
    # if @nugget.user == current_user 
      @nugget.destroy
      redirect_to root_path, :notice => "You deleted some of your advice...not cool"
    # end
  end

end