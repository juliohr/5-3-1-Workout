class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  before_action :require_user

  def index
    @programs = current_user.programs
  end

  def show
    if current_user == Program.find(params[:id]).user
      redirect_to program_cycles_path params[:id]
    else
      redirect_to programs_path
    end
  end

  def new
    @program = Program.new
  end

  def create
    begin
      #exception if required param is not sent
      @program = current_user.programs.new(get_program_params)
      @program.initialize_cycle
    
      if @program.save 
        redirect_to @program, notice: 'Program was successfully created.'
      else
        render :new
      end
    rescue
        render :new
    end
  end

  def destroy
    if Program.destroy(params[:id])
      redirect_to programs_path, notice: 'Program was successfully deleted'
    else
      redirect_to programs_path, notice: 'There was a problem deleting your program'
    end
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def get_program_params
      fetched = params.fetch(:program)
      parsed_date = Date.new(
        fetched.require("start_date(1i)").to_i,
        fetched.require("start_date(2i)").to_i,
        fetched.require("start_date(3i)").to_i
      ) 
      {
        one_rm_squat: fetched.require(:one_rm_squat),
        one_rm_bench_press: fetched.require(:one_rm_bench_press),
        one_rm_deadlift: fetched.require(:one_rm_deadlift),
        one_rm_overhead_press: fetched.require(:one_rm_overhead_press),
        start_date: parsed_date
      }
    end
end
