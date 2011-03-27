class ListsController < ApplicationController
  respond_to :html, :json
  
  def my_lists
    @user = current_user
    respond_with @user
  end
  
  def new
    @list = List.new
    respond_with @list
  end
  
  def create
    @list = List.new(params[:list])
    flash[:notice] = "The list has been created successfully" if @list.save
    current_user.lists<<@list
    current_user.save!
    respond_with(@list) do |format|
      format.html { redirect_to list_path(@list) }
    end
  end
  
  def show
    @list = List.find(params[:id])
    respond_with @user
  end
end
