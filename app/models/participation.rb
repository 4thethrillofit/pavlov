class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  def calculate_participant_progress
    # return false if nil
    (amount.to_f / challenge.fitness_amount) * 100 unless nil
  end
end

# number_to_percentage(participant.current_participation(@challenge).calculate_participant_progress, precision: 2)