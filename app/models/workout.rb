class Workout < ApplicationRecord
	belongs_to :cycle
	belongs_to :program
	has_and_belongs_to_many :exercises
  
  validates_presence_of :cycle_week

  def initialize_exercise(exercise_name, on_rm)
    exercise = Exercise.new()
    exercise.name = exercise_name
    exercise.one_rm = on_rm
    exercise.initialize_sets
    exercises << exercise
  end
end
