class ParticipationsController < ApplicationController
  def create
    debugger
    @challenge = Challenge.find_by(:id => params[:challenge_id])
    @participant = User.find_by(:email => params[:challenge][:participant_email])
    if @challenge
      @challenge.participants << @participant
      flash[:success] = "Participant successfully added!"
      redirect_to challenge_path(@challenge)
    else
      flash[:warning] = "User does not exist :("
      redirect_to request.referrer
    end
  end

  # def destroy
  #   challenge = Challenge.find_by(:id => params[:challenge_id])
  #   participant = User.find_by(:id => params[:id])
  #   challenge.participants.delete(participant)
  #   flash[:success] = "Participant successfully removed from the challenge."
  #   redirect_to request.referrer
  # end
end
