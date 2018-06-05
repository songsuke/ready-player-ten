class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = 'Images have been uploaded successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Cannot upload the images'
      render :new
    end
  end

  private def post_params
    params.require(:post).permit(images: [])
  end
end
