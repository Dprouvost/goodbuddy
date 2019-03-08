class ProfilesController < ApplicationController

  def index
    # @profiles = Profile.all
    # afficher les profiles dans l'ordre de matching score décroissant (sauf le current_profile)
  end

  def new
    # @profile = Profile.new
  end

  def create
    # @profile = Profile.new(params_profile)
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
      # params.require(@:rofile).permit(:nickname, :picture, :location, :description)
    end

    def set_profile
      # @profile = Profile.find(params[:id])
    end

end
