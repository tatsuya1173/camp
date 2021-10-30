class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @posts = @user.posts
    @items = Item.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def new 
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      render "edit"
    else
      redirect_to posts_path
    end
  end
  
  def create
      @post = Post.new(post_params)
      if @post.save
        last_id = Post.last(1)
        flash[:notice] = 'Create successfully'
        redirect_to controller: :posts, action: :show, id: last_id
      else
        flash[:alert] = 'Create not successfully'
        @post = Post.new(post_params)
        render :new
      end
  end
  
  def update
    @post = Post.find(params[:id])
    if
      @post.update(post_params)
      flash[:notice] = 'Update successfully'
      redirect_to controller: :posts, action: :show, id: params[:id]
    else
      flash[:alert] = 'Update not successfully'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: 'Delete successfully'
  end
  
  private
  def post_params
    params.require(:post).permit(:user_id,:image, :image_title,:description )
  end
end
