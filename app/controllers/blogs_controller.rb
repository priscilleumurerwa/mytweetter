class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
      @blogs = Blog.all
   
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "You have deleted the blog!"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.create(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "You have created new blog!"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "You have edited this blog！"
    else
      render :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :content, :dob)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
