class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    render json: @profile
  end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:given_name, :surname, :dob, :state)
  end
end
