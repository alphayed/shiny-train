class PagesController < ApplicationController
    def index
        @ignore  = true
        if user_signed_in?
            redirect_to  user_path(current_user)
        end
    end
end
