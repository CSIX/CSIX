class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    # Creates a new user, with a default role of user
    @user = User.new(params[:user], :role_id => Role.find_by_name("user").id)
    if @user.save
      flash[:notice] = "Registration Successfully"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user info."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
