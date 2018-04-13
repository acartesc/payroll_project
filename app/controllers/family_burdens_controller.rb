class FamilyBurdensController < ApplicationController
  before_action :set_family_burden, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /family_burdens
  # GET /family_burdens.json
  def index
    @family_burdens = FamilyBurden.where(worker_id: params[:worker_id])
    @worker = Worker.find(params[:worker_id])
  end

  # GET /family_burdens/1
  # GET /family_burdens/1.json
  def show
  end

  # GET /family_burdens/new
  def new
    @family_burden = FamilyBurden.new
  end

  # GET /family_burdens/1/edit
  def edit
  end

  # POST /family_burdens
  # POST /family_burdens.json
  def create
    @family_burden = FamilyBurden.new(family_burden_params)
    @family_burden.worker = Worker.find(params[:worker_id])

    respond_to do |format|
      if @family_burden.save
        format.html { redirect_to worker_family_burden_path(@family_burden.worker.id, @family_burden.id), notice: 'Family burden was successfully created.' }
        format.json { render :show, status: :created, location: @family_burden }
      else
        format.html { render :new }
        format.json { render json: @family_burden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_burdens/1
  # PATCH/PUT /family_burdens/1.json
  def update
    respond_to do |format|
      if @family_burden.update(family_burden_params)
        format.html { redirect_to worker_family_burdens_path(@family_burden.worker), notice: 'Family burden was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_burden }
      else
        format.html { render :edit }
        format.json { render json: @family_burden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_burdens/1
  # DELETE /family_burdens/1.json
  def destroy
    @family_burden.destroy
    respond_to do |format|
      format.html { redirect_to worker_family_burdens_path(@family_burden.worker), notice: 'Family burden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_burden
      @family_burden = FamilyBurden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_burden_params
      params.require(:family_burden).permit(:rut, :name, :worker_id)
    end
end
