class ExerciseSet < ApplicationRecord
	validates_presence_of :weight, :reps
end
