class Workout < ApplicationRecord
	belongs_to :cycle
  has_many :exercise_workouts
	has_many :exercises, through: :exercise_workouts
  
  validates_presence_of :cycle_week, :status

  def initialize_exercise(exercise_name, one_rm)
    exercise = Exercise.new({name: exercise_name})
    exercise.initialize_sets(cycle_week, one_rm)
    exercises << exercise
  end
end
