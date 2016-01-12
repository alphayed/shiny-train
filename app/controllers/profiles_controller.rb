class ProfilesController < ApplicationController
    def new
        # form where a use will fill out ther own profile.
        @user = User.find( params[:user_id] )
        @profile = Profile.new
    end
    
    def create
        @user = User.find( params[:user_id] )
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Info Updated!"
            redirect_to user_path( params[:user_id] )
        else
            render action: :new
        end
    end 
    
    def edit
        @user = User.find( params[:user_id] )
        @profile = @user.profile
        
    end
    
    def show
      
    end
    
    private 
        def profile_params
            params.require(:profile).permit(:user_id, :first_name, :last_name, :phone_number, :contact_email, :address, :city, :postal_code)
        end
end
