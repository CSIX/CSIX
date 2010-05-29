class UsersController < ApplicationController
  
  def new
    if !current_user
      @user = User.new
    else
      flash[:error] = "You already have an account."
      redirect_to root_url
    end
  end

  def create
    @user = User.new(params[:user])
    @user.role_id = Role.find_by_name("user").id
    if @user.save
      flash[:notice] = "Registration Successful"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      flash[:notice] = "Woah boy! Hold on there. You can't edit someone else's profile."
      redirect_to root_url
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user info."
      render :action => :edit
    else
      flash[:error] = "Sorry But something went wrong."
      render :action => :edit
    end
  end
  
  def show
    if !User.find_by_id params[:id]
      flash[:error] = "User does not exist"
      redirect_to root_url 
    else
      @user = User.find params[:id]
    end
  end
  
end
