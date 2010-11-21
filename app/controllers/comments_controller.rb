class CommentsController < ApplicationController

 before_filter :authenticate_user!
   def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(params[:comment])
      @comment.user_id = current_user.id
      safe_save(@comment)
      flash[:notice] = "Thanks for your comment!"
        redirect_to post_path(@post)
   end

   def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      if im_owner(@comment)
         @comment.destroy
      end
      flash[:notice] = "comment Deleted!"
       redirect_to post_path(@post)
   end

end
