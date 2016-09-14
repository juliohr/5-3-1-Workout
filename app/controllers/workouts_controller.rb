class WorkoutsController < ApplicationController
  before_action :require_user

  def show
    @workout = Workout.find(params[:id])
    @exercise_sets = ExerciseSet.where(exercise_id: @workout.exercises.first.id).all
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.status = params[:status]
    if @workout.save
      redirect_to programs_url notice: 'Workout was successfully updated.'
    else
      render :show
    end
  end
end 