class LinksController < ApplicationController
  before_action :set_link, only: %i[ show update destroy ]

  # GET /posts
  def index
    @links = Link.all
    render :index
    # render json: @posts
  end

  # GET /posts/1
  def show
    # render json: @post
    @link = Link.find_by(id: params[:id])
    render :show
  end

  # POST /posts
  def create
    @link = Link.new(
      title: params[:title],
      subline: params[:link],
    )
    @link.save
    render :show
    # if @post.save
    #   render json: @post, status: :created, location: @post
    # else
    #   render json: @post.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /posts/1
  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @link.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = Link.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:title, :link)
  end
end
