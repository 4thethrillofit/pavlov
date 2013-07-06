class ChallengesController < ApplicationController
  def index
    @challenges = current_user.participating_challenges.to_a
  end

  def show
    @challenge = Challenge.find_by(:id)
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    if @challenge.save
      @challenge.participants << current_user
      flash[:success] = "Challenge created!"
      redirect challenge_path(@challenge)
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
    @current_user ||= User.first
  end

  def is_logged_in?
    current_account ? true : false
  end
end
