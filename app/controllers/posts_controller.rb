class PostsController < ApplicationController
  before_action :authenticate, only: [:admin, :new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def admin
    redirect_to root_path if authenticate
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post), notice: "The post was created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Updated"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post destroyed"
  end

protected
  # for admin access:
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      admin_username = ENV["ADMIN_USERNAME"]
      admin_password = ENV["ADMIN_PASSWORD"]
      username == admin_username && password == admin_password
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :content, :date)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
