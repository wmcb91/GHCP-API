class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :update, :destroy]

  def index
    @rounds = Round.all
    render json: @rounds
  end

  def show
    render json: @round
  end

  def create
    @round = Round.new(round_params)

    if @round.save
      render json: @round, status: :created
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  def update
    if @round.update(round_params)
      render json: @round, status: :ok
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @round.destroy
      head :no_content
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:course, :date, :rating, :slope, :par, :score)
  end
end
