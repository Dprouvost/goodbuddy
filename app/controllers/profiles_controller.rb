class ProfilesController < ApplicationController

  def index
    @profiles_id = ScoreMatchingService.new(social_weight: 2, style_weight: 2, language_weight: 2, experience_weight: 2, current_user: current_user).call
    @profiles = @profiles_id.map do |element|
      Profile.find(element) 
    end
    fail
    # afficher les profiles dans l'ordre de matching score décroissant (sauf le current_profile)
  end

  def new
    # @profile = Profile.new
  end

  def create
    # @profile = Profile.new(profile_settings)
    # if @profile.save
    #   redirect_to root_path #mettre la route de la roue
    # else
    #   render :new
    # end
  end

  def edit
    
  end

  def show
    # afficher le profile qui a le matching score le plus élevé (sauf le current_profile)
  end

  def update
  end

  private

    def profile_params
      # params.require(@profile).permit(:nickname, :picture, :location, :description)
    end

    def set_profile
      # @profile = Profile.find(params[:id])
    end

end
