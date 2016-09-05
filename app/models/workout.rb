class Workout < ApplicationRecord
	belongs_to :cycle
	has_and_belongs_to_many :exercises
  
  validates_presence_of :cycle_week

  def initialize_exercise(exercise_name, one_rm)
    exercise = Exercise.new()
    exercise.name = exercise_name
    exercise.initialize_sets(cycle_week, one_rm)
    exercises << exercise
  end
end
