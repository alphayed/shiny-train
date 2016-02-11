class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_profile
  before_action :find_user

  def new
    @profile = Profile.new
  end

  def create
    @profile = @user.build_profile(profile_params)

    if @profile.save
      flash[:success] = " Info Added"
      redirect_to new_user_order_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def edit
    if current_user.profile
      @profile = @user.profile
    else
      redirect_to(new_user_profile_path(current_user))
    end
  end

  def update
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = " Info Updated"
      redirect_to edit_user_profile_path(current_user)
    else
      render action: :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name, :phone_number, :contact_email, :address, :city, :postal_code)
  end

end
