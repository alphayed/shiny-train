class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def after_sign_in_path_for(root_path)
      session["new_user_order_return_to"] || new_user_order_path(current_user)
    end

    def validate_user_profile
      @user = User.find( params[:user_id] )
      redirect_to(edit_user_profile_path(current_user)) unless @user == current_user
    end

    def validate_user
      # @user = User.find_by_id( params[:id] )
      # redirect_to(new_user_order_path(current_user)) unless @user == current_user
    end

end
