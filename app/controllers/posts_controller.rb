class PostsController < ApplicationController
 before_action :all_posts, only: [:index, :create, :update, :destroy]
  respond_to :html, :js

   def new
    @post = Post.new
  end

  def create
    @post  = Post.create(post_params)
  end

def update
    @post.update_attributes(post_params)
  end
  
   def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  private

    def all_posts
      @posts = Post.all
    end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end

end
