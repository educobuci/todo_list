class UsersController < ApplicationController
  respond_to :html
  
  def follow_list
    list = List.find(params[:id])
    current_user.following<<list
    redirect_to user_root_url, :notice => "You are now following \"#{list.name}\""
  end
  
  def unfollow_list
    list = List.find(params[:id])
    current_user.following.delete list
    redirect_to user_root_url, :notice => "You are not anymore following \"#{list.name}\""
  end
end
