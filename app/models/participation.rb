class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :challenge

  def calculate_participant_progress
    # return false if nil
    (challenge.fitness_amount / amount.to_f) * 100 unless nil
  end
end