class ListsController < ApplicationController
  respond_to :html, :json
  
  def my_lists
    @user = current_user
  end
  
  def new
    
  end
  
end
