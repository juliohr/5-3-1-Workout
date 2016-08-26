class Exercise < ApplicationRecord
	validates_presence_of :name
	has_and_belongs_to_many :workouts
	has_many :exercise_sets
end
