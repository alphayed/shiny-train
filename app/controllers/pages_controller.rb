class PagesController < ApplicationController
    def index
        @ignore  = true
        if user_signed_in?
            redirect_to  new_user_order_path(current_user)
        end
    end
end
