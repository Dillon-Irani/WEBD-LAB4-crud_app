class GundamsController < ApplicationController
  before_action :set_gundam, only: %i[ show edit update destroy ]

  # GET /gundams or /gundams.json
  def index
    @gundams = if params[:search]
                 Gundam.where('name LIKE ?', "%#{params[:search]}%")
               else
                 Gundam.all
               end
  end

  # GET /gundams/1 or /gundams/1.json
  def show
  end

  # GET /gundams/new
  def new
    @gundam = Gundam.new
  end

  # GET /gundams/1/edit
  def edit
  end

  # POST /gundams or /gundams.json
  def create
    @gundam = Gundam.new(gundam_params)

    respond_to do |format|
      if @gundam.save
        format.html { redirect_to gundam_url(@gundam), notice: "Gundam was successfully created." }
        format.json { render :show, status: :created, location: @gundam }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gundam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gundams/1 or /gundams/1.json
  def update
    respond_to do |format|
      if @gundam.update(gundam_params)
        format.html { redirect_to gundam_url(@gundam), notice: "Gundam was successfully updated." }
        format.json { render :show, status: :ok, location: @gundam }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gundam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gundams/1 or /gundams/1.json
  def destroy
    @gundam.destroy!

    respond_to do |format|
      format.html { redirect_to gundams_url, notice: "Gundam was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gundam
      @gundam = Gundam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gundam_params
      params.require(:gundam).permit(:name, :series, :scale)
    end
end
