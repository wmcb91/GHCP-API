class ProfilesController < ProtectedController
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
    @profiles = current_user.profiles
    # @profiles = Profile.all
    render json: @profiles
  end

  # GET /profiles/:id
  def show
    render json: @profile
  end

  # POST /profiles
  def create
    @profile = current_user.profiles.build(profile_params)
    # @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH /profiles/:id
  def update
    if @profile.update(profile_params)
      render json: @profile, status: :ok
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/:id
  def destroy
    if @profile.destroy
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile.find(params[:id])
  end

  # def set_profile
  #   @profile = Profile.find(params[:id])
  # end

  def profile_params
    params.require(:profiles).params.permit(:surname,
                                            :home_course,
                                            :user_id,
                                            :given_name)
  end
end
