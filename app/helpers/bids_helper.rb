module BidsHelper
   # Check the current user has already placed the bid
   def bid_already_placed? (post)
       post.bids.each do |bid|
           if im_owner(bid)
              return TRUE
           end
       end
       return FALSE
   end

end
