class PagesController < ApplicationController
  def contact
    @title = "Contact"
  end
  
  def home
    @title = "Home"
    @nuggets = Nugget.all
    if current_user
      @nugget = Nugget.new 
    end
  end
  
  def about
    @title = "About"
  end

end
