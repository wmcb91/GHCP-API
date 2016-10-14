class RoundsController < ProtectedController
  # before_action :set_round, only: [:destroy]
  before_action :set_profile, only: [:create, :destroy]

  # def index
  #   @rounds = current_user.profiles.all
  #   @rounds = Rounds.all
  #   render json: @rounds
  #   @rounds = current_user.profiles.findBy(params[:id]).rounds
  #   @rounds = @profile.rounds.all
  #   render json: @rounds
  # end

  # def show
  #   render json: @round
  # end
  # if current_user owns profile_id, you can give post.

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
                                  :slope)
  end
end
