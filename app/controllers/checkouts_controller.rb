class CheckoutsController < ApplicationController
  def new
    
  end

  def create
    p params
    render :nothing => true, :status => :ok
  end
end
