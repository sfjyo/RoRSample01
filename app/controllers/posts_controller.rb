class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show]
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to current_user
    else
      render :new
    end
  end


  def edit
  end


  def update
  end

  def show
    current_user.posts
  end

  private
  def set_post
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :comment)
  end

  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
