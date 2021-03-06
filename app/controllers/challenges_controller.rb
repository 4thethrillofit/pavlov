class ChallengesController < ApplicationController
  def index
    @active_challenges = current_user.participating_challenges.active_challenges
    @inactive_challenges = current_user.participating_challenges.inactive_challenges
  end

  def show
    @challenge = Challenge.find_by(:id => params[:id])
    @participants = @challenge.participants
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = current_user.created_challenges.new(challenge_params)
    if @challenge.save
      @challenge.participants << current_user
      flash[:success] = "Challenge created!"
      redirect_to challenge_path(@challenge)
    else
      flash[:warning] = "Challenge not saved."
      # TO DO: propagate errors from @challenge
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def challenge_params
    params.require(:challenge).permit(:activity_type, :dollars_per_person, :fitness_amount, :start_date, :end_date)
  end
end
