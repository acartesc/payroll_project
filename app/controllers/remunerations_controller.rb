class RemunerationsController < ApplicationController
  before_action :set_remuneration, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /remunerations
  # GET /remunerations.json
  def index
    @remunerations = Remuneration.where(worker_id: params[:worker_id])
    @worker = Worker.find(params[:worker_id])
  end

  # GET /remunerations/1
  # GET /remunerations/1.json
  def show
  end

  # GET /remunerations/new
  def new
    @remuneration = Remuneration.new
    @worker = Worker.find(params[:worker_id])
    @remuneration.worker = @worker
  end

  # GET /remunerations/1/edit
  def edit
    @worker = Worker.find(params[:worker_id])
    @remuneration.worker = @worker
  end

  # POST /remunerations
  # POST /remunerations.json
  def create
    @remuneration = Remuneration.new(remuneration_params)
    @remuneration.worker = Worker.find(params[:worker_id])

    respond_to do |format|
      if @remuneration.save
        format.html { redirect_to worker_remuneration_path(@remuneration.worker.id, @remuneration.id), notice: 'Remuneration was successfully created.' }
        format.json { render :show, status: :created, location: @remuneration }
      else
        format.html { render :new }
        format.json { render json: @remuneration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /remunerations/1
  # PATCH/PUT /remunerations/1.json
  def update

    respond_to do |format|
      if @remuneration.update(remuneration_params)
        format.html { redirect_to worker_remuneration_path(@remuneration.worker.id, @remuneration.id), notice: 'Remuneration was successfully updated.' }
        format.json { render :show, status: :ok, location: @remuneration }
      else
        format.html { render :edit }
        format.json { render json: @remuneration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remunerations/1
  # DELETE /remunerations/1.json
  def destroy
    @remuneration.destroy
    respond_to do |format|
      format.html { redirect_to worker_remunerations_path(@remuneration.worker.id), notice: 'Remuneration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_remuneration
      @remuneration = Remuneration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def remuneration_params
      params.require(:remuneration).permit(:month, :business_name, :taxpayer_id_company, :worker_rut, :worker_name,
        :pension_fund_name, :pension_fund_deduction, :health_plan_name, :health_plan_deduction, :base_salary, :absence,
        :extra_hour, :family_burden, :taxable, :bonus, :advance_payment, :tax_base, :food_allowance,
        :transportation_allowance, :non_tax_base, :total_legal_discount, :pension_fund_discount, :health_discount,
        :unique_tax_discount, :unemployment_insurance, :total_legal_discount, :advance_payment_discount,
        :total_other_discount, :total_asset, :total_discount, :net_pay, :worker_id, :legal_bonus)
    end
end
