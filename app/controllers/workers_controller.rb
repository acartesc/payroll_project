class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]


  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
    @worker.company = Company.find(params[:company_id])
  end

  # GET /workers/1/edit
  def edit
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)
    @worker.health_plan = HealthPlan.new(health_plan_params)
    @worker.base_salary = BaseSalary.new(base_salary_params)
    @worker.company = Company.find(params[:company_id])
    respond_to do |format|
      if @worker.save
        format.html { redirect_to company_path(@worker.company), notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update(worker_params) && @worker.health_plan.update(health_plan_params) && @worker.base_salary_attributes.update(base_salary_params)
        format.html { redirect_to company_path(@worker.company), notice: 'Worker was successfully updated.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to company_path(@worker.company), notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # def set_company
    #   @company = Company.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:rut, :first_name, :middle_name, :last_name1, :last_name2, :birthdate,:gender, :email, :phone, :address_region, :address_city, :address_street, :address_number, :address_apartment)
    end

    def health_plan_params
      params.require(:worker).require(:health_plan_attributes).permit(:name, :deduction)
    end

    def base_salary_params
      params.require(:worker).require(:base_salary_attributes).permit(:amount)
    end
end
