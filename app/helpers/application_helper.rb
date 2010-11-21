module ApplicationHelper

    def im_owner (object)
        if object.user_id == current_user.id
           return TRUE
        else 
           return FALSE
        end
    end

    def safe_save (object)
        unless object.save
            #TODO: Need a customized busy error page
            flash[:notice] = "something Went wrong , Please try after a few seconds"
            return  # Need to handle save failures properly
        end
    end
end
