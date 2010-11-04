class BidsController < ApplicationController
 before_filter :authenticate_user!
   def create
      @post = Post.find(params[:post_id])
      if @post.user_id == current_user.id # This if should never be true, blocked at view level
          redirect_to post_path(@post)
          return
      end
      @post.bids.each do |bid| # Check the current user has already placed the bid
          if bid.user_id == current_user.id
             flash[:notice] = "Your Bid is already placed"
             redirect_to post_path(@post)
             return
          end
      end
      @bid = @post.bids.create(params[:bid])
      @bid.user_id = current_user.id
      @bid.post_id = @post.id
      @bid.save # Handle save failures
      @post.bid_count =  1 + (@post.bid_count).to_i; 
      @post.save
      flash[:notice] = "Thanks for your bid!"
        redirect_to post_path(@post)
   end

   def destroy
      @post = Post.find(params[:post_id])
      @bid = @post.bids.find(params[:id])
      if @bid.user_id == current_user.id
         @post.bid_count--
         @post.save
         @bid.destroy
      end
      flash[:notice] = "bid Deleted!"
       redirect_to post_path(@post)
   end

end
