class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    redirect_to program_cycles_path params[:id]
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  # POST /programs.json
  def create 
    @program = Program.new(get_program_params)
    @program.initialize_cycle
    
    if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { render :show, status: :ok, location: @program }
      else
        format.html { render :edit }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url, notice: 'Program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def get_program_params
      raw_params = params.fetch(:program).permit(
        :person_name,
        "start_date(1i)",
        "start_date(2i)",
        "start_date(3i)",
        :one_rm_squat,
        :one_rm_bench_press,
        :one_rm_deadlift,
        :one_rm_overhead_press
      )
      parse_params(raw_params)
    end

    def parse_params(raw_params)
      parsed_date = Date.new(
        raw_params["start_date(1i)"].to_i,
        raw_params["start_date(2i)"].to_i,
        raw_params["start_date(3i)"].to_i
      )
      program = { 
        person_name: raw_params[:person_name],
        one_rm_squat: raw_params[:one_rm_squat],
        one_rm_bench_press: raw_params[:one_rm_bench_press],
        one_rm_deadlift: raw_params[:one_rm_deadlift],
        one_rm_overhead_press: raw_params[:one_rm_overhead_press],
        start_date: parsed_date
      }
    end
end
