require 'pry'

class HandicapsController < ProtectedController
  before_action :set_profile, only: [:applicable_rounds]
  # before_action :set_rounds_number, only: [:show, :update]

  # GET /profiles/:id
  def applicable_rounds
    @rounds = @profile.rounds.order_by(:date_played).limit(20)
  end

  def lowest_rounds
    @lowest_rounds = @rounds.order_by(:score).limit(set_rounds_number)
  end

  def differential

  end

  # def rounds_played
  #   # puts 'Number of rounds played is'
  #   @rounds_played = profile.rounds.length
  # end

  def differentials_used
    @rounds_played = @profile.rounds.length
    if @rounds_played < 5
      @differentials_used = 0
    elsif @rounds_played == 5 || @rounds_played == 6
      @differentials_used = 1
    elsif @rounds_played == 7 || @rounds_played == 8
      @differentials_used = 2
    elsif @rounds_played == 9 || @rounds_played == 10
      @differentials_used = 3
    elsif @rounds_played == 11 || @rounds_played == 12
      @differentials_used = 4
    # elsif @rounds_played == 13 || @rounds_played == 14
    #   return 5
    # elsif @rounds_played == 15 || @rounds_played == 16
    #   return 6
    # elsif @rounds_played == 17
    #   return 7
    # elsif @rounds_played == 18
    #   return 8
    # elsif @rounds_played == 19
    #   return 9
    # elsif @rounds_played >= 20
    #   return 10
    end
  end

  private

  # May not be necessary.
  def set_profile
    @profile = current_user.profiles.find(params[:id])
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
