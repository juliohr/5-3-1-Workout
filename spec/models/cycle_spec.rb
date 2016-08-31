require 'rails_helper'

RSpec.describe Cycle, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryGirl.build(:cycle)).to be_valid
  end

  it "is invalid without required attributes" do
    expect(FactoryGirl.build(:cycle, number: nil)).to be_invalid
  end

  describe ".initialize_workouts" do
    let(:cycle) { FactoryGirl.build(:cycle)}
    all_one_rm = {
      one_rm_squat: 100,
      one_rm_bench_press: 90,
      one_rm_deadlift: 80,
      one_rm_overhead_press: 70
    }
    before { cycle.initialize_workouts(all_one_rm) }

    context "workouts" do
      it { expect(cycle.workouts).to_not be_empty }

      context "total" do
        it { expect(cycle.workouts.size).to eq(16) }
      end
    end

    context "cycle week 1" do
      context "squat workout" do
        subject (:workouts) { cycle.workouts.select { |w| w[:cycle_week] == 1 && w.name == "squat" } }

        it { expect(workouts.first.name).to eq("squat")}

        context "squat exercise" do
          subject (:exercise) { workouts.first.exercises.first }

          context "first set" do
            context "weight" do
              it { expect(exercise.exercise_sets.first.weight).to eq(40) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.first.reps).to eq(5) } 
            end  
          end

          context "second set" do
            context "weight" do
              it { expect(exercise.exercise_sets[1].weight).to eq(47) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[1].reps).to eq(5) } 
            end  
          end

          context "third set" do
            context "weight" do
              it { expect(exercise.exercise_sets[2].weight).to eq(55) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[2].reps).to eq(3) } 
            end  
          end

          context "fourth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[3].weight).to eq(65) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[3].reps).to eq(5) } 
            end  
          end

          context "fifth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[4].weight).to eq(75) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[4].reps).to eq(5) } 
            end  
          end

          context "sixth set" do
            context "weight" do
              it { expect(exercise.exercise_sets.last.weight).to eq(85) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.last.reps).to eq(5) } 
            end  
          end
        end
      end

      context "deadlift workout" do
        subject (:workouts) { cycle.workouts.select { |w| w[:cycle_week] == 1 && w.name == "deadlift" } }

        it { expect(workouts.first.name).to eq("deadlift")}

        context "deadlift exercise" do
          subject (:exercise) { workouts.first.exercises.first }

          context "first set" do
            context "weight" do
              it { expect(exercise.exercise_sets.first.weight).to eq(32) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.first.reps).to eq(5) } 
            end  
          end

          context "second set" do
            context "weight" do
              it { expect(exercise.exercise_sets[1].weight).to eq(37) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[1].reps).to eq(5) } 
            end  
          end

          context "third set" do
            context "weight" do
              it { expect(exercise.exercise_sets[2].weight).to eq(44) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[2].reps).to eq(3) } 
            end  
          end

          context "fourth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[3].weight).to eq(52) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[3].reps).to eq(5) } 
            end  
          end

          context "fifth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[4].weight).to eq(60) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[4].reps).to eq(5) } 
            end  
          end

          context "sixth set" do
            context "weight" do
              it { expect(exercise.exercise_sets.last.weight).to eq(68) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.last.reps).to eq(5) } 
            end  
          end
        end
      end

      context "overhead press workout" do
        subject (:workouts) { cycle.workouts.select { |w| w[:cycle_week] == 1 && w.name == "overhead press" } }

        it { expect(workouts.first.name).to eq("overhead press")}

        context "overhead press exercise" do
          subject (:exercise) { workouts.first.exercises.first }

          context "first set" do
            context "weight" do
              it { expect(exercise.exercise_sets.first.weight).to eq(28) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.first.reps).to eq(5) } 
            end  
          end

          context "second set" do
            context "weight" do
              it { expect(exercise.exercise_sets[1].weight).to eq(32) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[1].reps).to eq(5) } 
            end  
          end

          context "third set" do
            context "weight" do
              it { expect(exercise.exercise_sets[2].weight).to eq(38) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[2].reps).to eq(3) } 
            end  
          end

          context "fourth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[3].weight).to eq(45) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[3].reps).to eq(5) } 
            end  
          end

          context "fifth set" do
            context "weight" do
              it { expect(exercise.exercise_sets[4].weight).to eq(52) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets[4].reps).to eq(5) } 
            end  
          end

          context "sixth set" do
            context "weight" do
              it { expect(exercise.exercise_sets.last.weight).to eq(59) }
            end
            context "reps" do
              it { expect(exercise.exercise_sets.last.reps).to eq(5) } 
            end  
          end
        end
      end
    end
  end
end
