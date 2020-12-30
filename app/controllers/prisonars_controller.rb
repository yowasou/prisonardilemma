class PrisonarsController < ApplicationController
  before_action :set_prisonar, only: [:show, :edit, :update, :destroy]

  # GET /prisonars
  # GET /prisonars.json
  def index
    @prisonars = Prisonar.all
  end

  # GET /prisonars/1
  # GET /prisonars/1.json
  def show
  end

  # GET /prisonars/new
  def new
    @prisonar = Prisonar.new
  end

  # GET /prisonars/1/edit
  def edit
  end

  # POST /prisonars
  # POST /prisonars.json
  def create
    @prisonar = Prisonar.new(prisonar_params)

    respond_to do |format|
      if @prisonar.save
        format.html { redirect_to @prisonar, notice: 'Prisonar was successfully created.' }
        format.json { render :show, status: :created, location: @prisonar }
      else
        format.html { render :new }
        format.json { render json: @prisonar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prisonars/1
  # PATCH/PUT /prisonars/1.json
  def update
    respond_to do |format|
      if @prisonar.update(prisonar_params)
        format.html { redirect_to @prisonar, notice: 'Prisonar was successfully updated.' }
        format.json { render :show, status: :ok, location: @prisonar }
      else
        format.html { render :edit }
        format.json { render json: @prisonar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prisonars/1
  # DELETE /prisonars/1.json
  def destroy
    @prisonar.destroy
    respond_to do |format|
      format.html { redirect_to prisonars_url, notice: 'Prisonar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prisonar
      @prisonar = Prisonar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prisonar_params
      params.require(:prisonar).permit(:name, :code, :win_count, :lose_count)
    end
end
