class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

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

  def update
    if @profile.update(profile_params)
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @profile.destroy
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.permit(:given_name, :surname, :home_course, :state, :user_id)
  end
end
