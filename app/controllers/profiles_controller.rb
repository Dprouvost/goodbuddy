class ProfilesController < ApplicationController

  def total_score
  # Objectif: definir un total_score
    # pour chacun des profiles selectionnés (ceux qui ont des commun_goals)
    # en les pondérant (en fonction du choix du current user)
    # score_goal x goal_weight, score_social x social_weight, score_language x language_weight, score_style x style_weight, score_experience x experience_weight
  end

  def commun_goals_profile_sample
    profile_sample = []
    current_user.profile.categories.each do |cat|
      profile_sample << cat.profiles.where.not(id: current_user.profile.id)
    end
    profile_sample.flatten.uniq
  end

  def score_goal
  # Objectif: definir un score_goal en fonction du nombre de goals en commun
    # 1- Pour chaque profile selectionné, calculer un score_goal, comme ci dessous:
      # score_goal = (nombre de goal.label en communs avec le current_profile / nombre total de goal.label du current_profile) x 100

    current_goals = []
    current_goals << current_user.profile.categories.where(stamp: 'goal')
    commun_goals_profile_sample.each do |profile|
      ((profile.categories.include?(current_goals).count)/(current_goals.count))/100
    end
  end
  
  def score_social
  # Objectif: definir un score_social en fonction du nombre de socials en commun
    # 1- Pour chaque profile, calculer un score_social, comme ci dessous:
      # score_social = (nombre de social.label en communs avec le current_profile / nombre total de social.label) x 100
    current_socials = []
    current_socials << current_user.profile.categories.where(stamp: 'social')
    commun_goals_profile_sample.each do |profile|
      ((profile.categories.include?(current_socials).count)/(socials.count))/100
    end
  end

  def score_language
  # Objectif: definir un score_language en fonction du nombre de language en commun mais aussi de leur ordre

    # 1- Créer le hash/array_language du current_profile avec ses 3 languages favoris via l'API de github, 3 clés : language_1, language_2 et language_3

    # 2- Sortir le même hash/array_language de tous les profiles de la DB qui ont au moins un commun_goal

    # 3- Pour chaque profile selectionné, comparer les valeurs de leur hash/array celles du current_profile

    # 4- Pour chaque profile, ajouter un score_language calculé comme ci dessous:
      # score_l1
      # if l1 = l1, score_l1 = 1.0
      # if l1 = l2, score_l1 = 0.7
      # if l1 = l3, score_l1 = 0.6
      # else score_l1 = 0
    # score_l2
      # if l2 = l1, score_l2 = 0.7
      # if l2 = l2, score_l2 = 0.9
      # if l2 = l3, score_l2 = 0.5
      # else score_l2 = 0
    # score_l3
      # if l3 = l1, score_l3 = 0.6
      # if l3 = l2, score_l3 = 0.5
      # if l3 = l3, score_l3 = 0.8
      # else score_l3 = 0
    # score_language = ((score_l1 + score_l2 + score_l3) / max_score) x 100
    
  end

  def score_style
  # Objectif: definir un score_style en fonction du commit_slot
    # 1- Pour chaque profile, calculer un score_style, comme ci dessous:
      # score_style =
        # if current_profile.commit_slot = profile.commit_slot, score_style = 100
        # if (current_profil.commit_slot - profile.commit_slot).abs = 1, score_style = 75
        # if (current_profil.commit_slot - profile.commit_slot).abs = 2, score_style = 50
        # if (current_profil.commit_slot - profile.commit_slot).abs = 3, score_style = 0

    current_style = current_user.profile.technicals.commit_slot
    profile_sample.each do |profile|
      if current_user.profile.technicals.commit_slot = profile.technicals.commit_slot
        score_style = 100
      elsif (current_user.profile.technicals.commit_slot = profile.technicals.commit_slot).abs = 1
        score_style = 75
      elsif (current_user.profile.technicals.commit_slot = profile.technicals.commit_slot).abs = 2
        score_style = 50
      else
        score_style = 0
      end
    end
  end

  def experience_score
  # Objectif: definir un score_experience en fonction de 4 KPI, en utilisant la méthode GoodBuddy
      # experience_score = (github_age_score + number_of_projects_score + total_commits_score + followers_score) / 4
  end

  def github_age_score 
    # profiles.commun_goal.all.github_age.each do |profile|
    #   score_1 = ((current_profile.technicals.github_age - profile.technicals.github_age).abs)
    # end
    # profiles.commun_goal.all.github_age.each do |profile|  
    # score_2 = (1 - (score_1/score_1_array.max)) x 100

    # end
  end

 
#________________________________________________________________________________________________________________________________

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
