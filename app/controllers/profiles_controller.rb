class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    # gestion de l'arriver depuis select_w
    weighting = Weighting.new(weighting_params)
    @profile = Profile.find(params[:id])
    @profile.weighting = weighting
    @profiles_scoring = ScoreMatchingService.new(
      social_weight: @profile.weighting.social,
      style_weight: @profile.weighting.style,
      language_weight: @profile.weighting.language,
      experience_weight: @profile.weighting.experience,
      current_user: current_user
    ).call

    @sorted_profiles = @profiles_scoring.map do |score, profile_id|
      {score: score, profile: Profile.find(profile_id).categories.where(stamp: 'goal')}
    end.sort_by { |e| e[:score] }

    # afficher les profiles dans l'ordre de matching score décroissant (sauf le current_profile)
  end

  def new
    @profile = Profile.new
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
    @profile = Profile.find(params[:id])
  end

  def show
    # afficher le profile qui a le matching score le plus élevé (sauf le current_profile)
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    redirect_to select_goals
  end

  private

    def profile_params
      params.require(@profile).permit(:nickname, :picture, :location, :description)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def weighting_params
      params.require(:weighting).permit(:language, :style, :experience, :social)
    end
end
