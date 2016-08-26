class ExerciseSet < ApplicationRecord
	validates_presence_of :weight, :reps
	belongs_to :exercise, required: true
end
