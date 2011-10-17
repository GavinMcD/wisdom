class NuggetsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  def create
    @nugget = current_user.nuggets.build(params[:nugget])
    if @nugget.save
      redirect_to root_path, :notice => "Your advice is awesome - people love your shit!"
    else
      redirect_to root_path, :error => "Something got botched on our side...we'll check it out"
    end
  end
  
  def destroy
    @nugget = current_user.nuggets.find(params[:id])
    if @nugget.user == current_user 
      @nugget.destroy
      redirect_to root_path, :notice => "You deleted some of your advice...not cool"
    end
  end

end