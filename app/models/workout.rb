class Workout < ApplicationRecord
	# belongs_to :cycle
	# belongs_to :program, :through => :cycle
	has_and_belongs_to_many :exercises
end
