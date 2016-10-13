class RoundsController < OpenReadController
  before_action :set_round, only: [:show, :update, :destroy]

  def index
    @rounds = current_user.rounds.all
    # @rounds = Rounds.all
    render json: @rounds
  end

  def show
    render json: @round
  end

  def create
    # @round = current_user.rounds.build(round_params)
    @round = Round.new(round_params)

    if @round.save
      render json: @round, status: :created
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  def update
    if @round.update(round_params)
      head :no_content
      # render json: @round, status: :ok
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

  # def set_profile
  #   @round = current_user.rounds.find(params[:id])
  # end

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(:course,
                                  :date_played,
                                  :par,
                                  :profile_id,
                                  :rating,
                                  :score,
                                  :slope)
  end
end
