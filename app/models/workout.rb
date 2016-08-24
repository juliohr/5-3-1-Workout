class Workout < ApplicationRecord
	belongs_to :cycle
	belongs_to :program, :through => :cycle
	has_many :exercises
end
