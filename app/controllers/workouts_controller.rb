class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
    @exercise_sets = ExerciseSet.where(exercise_id: @workout.exercises.first.id).all
    puts @exercise_sets
  end
end 