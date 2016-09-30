class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  def index
    @profiles = Profile.all
    render json: @profiles
  end

  def show
    render json: @profile
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
