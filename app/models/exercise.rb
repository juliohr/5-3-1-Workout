class Exercise < ApplicationRecord
	validates_presence_of :name
	has_and_belongs_to_many :workouts
	has_many :exercise_sets

  def initialize_sets
    [0.4, 0.47, 0.55, 0.65, 0.75, 0.85].each_with_index do |percentage, index|
      exercise_sets << ExerciseSet.new({ weight: (one_rm * percentage), reps: 5 }) if index != 2
      exercise_sets << ExerciseSet.new({ weight: (one_rm * percentage), reps: 3 }) if index == 2
    end
  end
end
