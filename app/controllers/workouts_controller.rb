class WorkoutsController < ApplicationController

  def show
    @exercise = Exercise.find_by(workout_id: params[:id])
    @exercise_sets = ExerciseSet.where(exercise_id: @exercise.id).all
    puts "$$$$$$$$$$$$$s$"
    puts @exercise_sets
  end
end 