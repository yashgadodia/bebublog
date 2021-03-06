class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #perform a validation to make sure user is logged in
  before_action :authenticate_user!, except: [:index, :show] #only index and show page does the user need not be logged in
  before_action :is_admin!, except: [:index, :show]


  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all.order("created_at DESC").paginate(page: params[:page])
    @posts = Post.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    respond_to do |format|
      format.html
      format.js
end
  end 

  # GET /posts/1
  # GET /posts/1.json
  def show
    views = @post.views + 1
    @post.update(views: views)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # binding.pry
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      # params.require(:post).permit(:title, :body, :thumbnail, :banner)
      params.require(:post).permit(:title, :body)
    end
  
    def test
    end
    
    def do_test
      name = params[:name]
      phone = params[:phone]
      # do whatever you want...
    end
end