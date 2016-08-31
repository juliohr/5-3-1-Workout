class Workout < ApplicationRecord
	belongs_to :cycle
	belongs_to :program
	has_and_belongs_to_many :exercises
  
  validates_presence_of :cycle_week
end
