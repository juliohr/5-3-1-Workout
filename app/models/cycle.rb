class Cycle < ApplicationRecord
  validates_presence_of :number
	has_many :workouts, dependent: :destroy

  def initialize_workouts(all_one_rm)
    cycle_weeks = [1,2,3,4]
    exercises = ["squat", "bench press", "deadlift", "overhead press"]
    cycle_weeks.each do |week|
      exercises.each do |ex|
        workout = Workout.new()
        workout.name = ex
        workout.cycle_week = week
        workout.status = 1
        workout.initialize_exercise(ex, select_one_rm(all_one_rm, ex))
        workouts << workout
      end
    end
  end

  private

  def select_one_rm(exercises, exercise_wanted)
    exercises.select { |k,v| k.to_s.include? exercise_wanted.split.first }.values.first 
  end
end
