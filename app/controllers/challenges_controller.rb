class ChallengesController < ApplicationController
  def index
    @challenges = current_user.participating_challenges.to_a
  end

  def show
    @challenge = Challenge.find_by(:id => params[:id])
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

  def current_user
    @current_user ||= User.last
  end

  def is_logged_in?
    current_account ? true : false
  end

private
  def challenge_params
    params.require(:challenge).permit(:activity_type, :dollars_per_person, :fitness_amount, :start_date, :end_date)
  end
end
