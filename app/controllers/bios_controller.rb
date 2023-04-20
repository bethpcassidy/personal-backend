class BiosController < ApplicationController
  before_action :set_bio, only: %i[ show update destroy ]

  # GET /bios
  # GET /bios.json
  def index
    @bios = Bio.all
    render :index
  end

  # GET /bios/1
  # GET /bios/1.json
  def show
    @bio = Bio.find_by(id: params[:id])
    render :show
  end

  # POST /bios
  # POST /bios.json
  def create
    @bio = Bio.new(bio_params)

    if @bio.save
      render :show, status: :created, location: @bio
    else
      render json: @bio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bios/1
  # PATCH/PUT /bios/1.json
  def update
    if @bio.update(bio_params)
      render :show, status: :ok, location: @bio
    else
      render json: @bio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bios/1
  # DELETE /bios/1.json
  def destroy
    @bio.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bio
    @bio = Bio.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bio_params
    params.require(:bio).permit(:name, :bodytext, :github)
  end
end
