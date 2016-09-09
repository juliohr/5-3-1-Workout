  class CyclesController < ApplicationController

    def index
      @cycles = Cycle.where(program_id: params[:program_id]).all
    end

    def show
      @cycle = Cycle.find(params[:id])
      @program = Program.find(params[:program_id])
      @workouts = group_by_cycle_week(Workout.where(cycle_id: @cycle.id).all)
    end

    def create
      @program = Program.find(params[:program_id])
      @program.initialize_new_cycle

      if @program.save
        redirect_to :index, notice: 'Program was successfully created.'
      else
        render :index
      end
    end

    private

    def group_by_cycle_week(workouts)
      {
        "Cycle Week 1": workouts.select { |w| w.cycle_week == 1},
        "Cycle Week 2": workouts.select { |w| w.cycle_week == 2},
        "Cycle Week 3": workouts.select { |w| w.cycle_week == 3},
        "Cycle Week 4": workouts.select { |w| w.cycle_week == 4},
      }    
    end
end