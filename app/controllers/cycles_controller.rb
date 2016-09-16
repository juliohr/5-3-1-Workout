  class CyclesController < ApplicationController
    before_action :require_user

    ATTRIBUTES_TO_INCLUDE = ["one_rm_squat", "one_rm_bench_press", "one_rm_deadlift", "one_rm_overhead_press"]

    def index
      if current_user == Program.find(params[:program_id]).user
        @cycles = Cycle.where(program_id: params[:program_id]).all
      else
        redirect_to '/'
      end
    end

    def show
      if current_user == Program.find(params[:program_id]).user
        @cycle = Cycle.find(params[:id])
        @program = Program.find(params[:program_id])
        @workouts = group_by_cycle_week(Workout.where(cycle_id: @cycle.id).all)
      else
        redirect_to programs_path
      end
    end

    def create
      @program = Program.find(params[:program_id])
      @cycle = Cycle.new({ number: @program.cycles.size + 1 })
      increment_program_one_rms
      @cycle.initialize_workouts(program_filtered_attributes)
      @program.cycles << @cycle
      @workouts = group_by_cycle_week(@cycle.workouts)

      if @program.save
        render :show, status: :created, notice: 'Cycle was successfully created.'
      else
        render :index, notice: 'Cycle could not be created'
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

    def increment_program_one_rms
      @program.one_rm_squat += 5
      @program.one_rm_bench_press += 2.5
      @program.one_rm_deadlift += 5
      @program.one_rm_overhead_press += 2.5
    end

    def program_filtered_attributes
      @program.attributes.keep_if { |k,v| ATTRIBUTES_TO_INCLUDE.include?(k) }
    end
end