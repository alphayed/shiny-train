class PagesController < ApplicationController
    def index
      # Removes the contact from the icon after the user signs in
        @ignore  = true
        if user_signed_in?
            redirect_to  new_user_order_path(current_user)
        end
    end
end
