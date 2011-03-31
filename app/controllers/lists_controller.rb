class ListsController < ApplicationController
  before_filter :check_ownership, :only => [:edit, :update]
  respond_to :html
  
  def my_lists
    @user = current_user
  end
  
  def new
    @list = List.new
    @list.items.build
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def create
    @list = List.new(params[:list])
    current_user.lists<<@list
    
    respond_with(@list) do |format|
      if current_user.save
        format.html { redirect_to edit_list_path(@list), :notice => "The list has been created successfully" }
      else
        @list.items.build
      end
    end
  end
  
  def update
    @list = List.find(params[:id])
    
    respond_with(@list) do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to edit_list_path(@list), :notice => "The list has been created updated" }
      else
        @list.items.build
      end
    end
  end
  
  def index
    @lists = List.publics.excluding_user(current_user)
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  private
  def check_ownership
    if List.find(params[:id]).user_id != current_user.id
      redirect_to user_root_url, :alert => 'Access denied'
    end
  end
end