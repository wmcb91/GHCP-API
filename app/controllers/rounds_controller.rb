class RoundsController < ProtectedController
  # before_action :set_round, only: [:destroy]
  before_action :set_profile, only: [:index, :create, :destroy]

  def index
    @rounds = @profile.rounds.all
    render json: @rounds
  end

  def create
    @round = @profile.rounds.build(round_params)

    if @round.save
      render json: @round, status: :created
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @round.update(round_params)
  #     head :no_content
  #     # render json: @round, status: :ok
  #   else
  #     render json: @round.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   if @round.destroy
  #     head :no_content
  #   else
  #     render json: @round.errors, status: :unprocessable_entity
  #   end
  # end

  private

  def set_profile
    @profile = current_user.profiles.find(params[:round][:profile_id])
  end

  def set_round
    @round = current_user.profiles.find(params[:round][:id])
  end

  def round_params
    params.require(:round).permit(:course,
                                  :date_played,
                                  :par,
                                  :profile_id,
                                  :rating,
                                  :score,
                                  :slope,
                                  :differential)
  end
end
