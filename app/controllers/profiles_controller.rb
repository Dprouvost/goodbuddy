class ProfilesController < ApplicationController

  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles_scoring = ScoreMatchingService.new(
      social_weight: 2,
      style_weight: 2,
      language_weight: 2,
      experience_weight: 2,
      current_user: current_user
    ).call
    # fail
  end

  def new
    @profile = Profile.new
  end

  def create
    # @profile = ProfileCreationService.new(profile_params).call
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
      # params.require(@profile).permit(:nickname, :picture, :location, :description, :language_1, :language_2, :language_3, :commit_slot, :github_age, :number_of_projects, :total_commits, :followers)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end

end
