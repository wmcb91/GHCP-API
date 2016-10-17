class HandicapsController < Open_Read_Controller
  before_action :set_rounds_number, only: [:show, :update]

  # GET /profiles/:id
  def show
    render json: @profile
  end

  def set_rounds_number
    

  private

  # May not be necessary.
  def set_profile
    @profile = current_user.profiles.find(params[:id])
  end
end
