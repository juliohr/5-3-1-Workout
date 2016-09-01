class Exercise < ApplicationRecord
	validates_presence_of :name
	has_and_belongs_to_many :workouts
	has_many :exercise_sets

  CYCLE_WEEK_SETS = {
    cw_1: [[0.4,5], [0.47, 5], [0.55,3], [0.65,5], [0.75,5], [0.85,5]],
    cw_2: [[0.4,5], [0.5, 5], [0.6,3], [0.7,3], [0.8,3], [0.9,3]]
  }

  def initialize_sets(cycle_week, one_rm)
    CYCLE_WEEK_SETS[:"cw_#{cycle_week}"].each do |set|
      exercise_sets << ExerciseSet.new({ weight: (one_rm * set[0]), reps: set[1] })
    end
  end
end
