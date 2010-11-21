class BidsController < ApplicationController
 include BidsHelper

 before_filter :authenticate_user!

   def create
      @post = Post.find(params[:post_id])
      if im_owner(@post)
          redirect_to post_path(@post)
          return
      end

      if bid_already_placed?(@post)
         flash[:notice] = "Your Bid is already placed"
         redirect_to post_path(@post)
         return
      end

      @bid = @post.bids.create(params[:bid])
      @bid.user_id = current_user.id
      @bid.post_id = @post.id
      safe_save(@bid) 
      @post.bid_count =  1 + (@post.bid_count).to_i; 
      safe_save(@post)
      flash[:notice] = "Thanks for your bid!"
        redirect_to post_path(@post)
   end

   def destroy
      @post = Post.find(params[:post_id])
      @bid = @post.bids.find(params[:id])
      if im_owner(@bid)
         @post.bid_count--
         safe_save(@post)
         @bid.destroy
      end
      flash[:notice] = "bid Deleted!"
       redirect_to post_path(@post)
   end

   def offer_bid
     @post = Post.find(params[:post_id])
     @bid = Bid.find(params[:id])
     @post.update_attribute(:bid_winner_id, @bid.user_id)
     safe_save(@post)
     flash[:notice] = "Task offered to @post.user.email"
        redirect_to post_path(@post)
  end

end
