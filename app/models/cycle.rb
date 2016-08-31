class Cycle < ApplicationRecord
  validates_presence_of :number
	has_many :workouts

  def initialize_workouts(all_one_rm_max)
    cycle_weeks = [1,2,3,4]
    exercises = ["squat", "bench press", "deadlift", "overhead press"]
    cycle_weeks.each do |week|
      exercises.each do |ex|
        workout = Workout.new()
        workout.cycle_week = week
        exercise = Exercise.new()
        exercise.name = ex
        exercise.one_rm_max = all_one_rm_max.select { |k,v| k.to_s.include? ex.split.first }.values.first
        exercise.initialize_sets
        workout.exercises << exercise
        workouts << workout
      end
    end
  end
end
