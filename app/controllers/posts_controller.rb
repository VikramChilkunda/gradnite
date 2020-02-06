class PostsController < ApplicationController
  before_action :admin_user, only: [:new]

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else 
      render 'new'
    end
  end
  
  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
    
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
