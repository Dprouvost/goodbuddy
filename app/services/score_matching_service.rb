
# total_score_ordered = ScoreMatchingService.new(social_weight: 2, style_weight: 3, ..., current_user: current_user).call

class ScoreMatchingService

  def initialize(attrs)
    @social_weight = attrs[:social_weight]
    @language_weight = attrs[:language_weight]
    @style_weight = attrs[:style_weight]
    @experience_weight = attrs[:experience_weight]
    @current_user = attrs[:current_user]
  end

  def call
  # Objectif: definir un total_score
    
    total_score = commun_goals_profile_sample.map do |id|
      goal_weight = 0.5 * (social_weight + language_weight + style_weight + experience_weight)
      score = ((score_goal(id) * goal_weight) + (score_social(id) * social_weight) + (score_language(id) * language_weight) + (score_style(id) * style_weight) + (score_experience(id) * experience_weight)) / (goal_weight + social_weight + language_weight + style_weight + experience_weight)
      [score, id]
    end
    total_score.sort_by { |element| -element[0] } # A vérifier
  end

  private

  def commun_goals_profile_sample
    current_user.profile.categories.where(stamp: 'goal').map do |category|  # Definir le current_user
      category.profiles.ids.where.not(id: current_user.profile.id)
    end.uniq
  end

  def score_goal(id)
  # Objectif: definir un score_goal en fonction du nombre de goals en commun
    (((Profile.find(id).categories.where(stamp: 'goal') + current_user.profile.categories.where(stamp: 'goal')).uniq.count)/((current_user.profile.categories.where(stamp: 'goal')).count))*100
  end

  def score_social(id)
  # Objectif: definir un score_social en fonction du nombre de socials en commun
    (((Profile.find(id).categories.where(stamp: 'social') + current_user.profile.categories.where(stamp: 'social')).uniq.count)/((current_user.profile.categories.where(stamp: 'social')).count))*100
  end

  def score_language(id)
  # Objectif: definir un score_language en fonction du nombre de language en commun mais aussi de leur ordre

    current_user_language_array = []
    current_user_language_array << current_user.profile.tecnhical.language_1
    current_user_language_array << current_user.profile.tecnhical.language_2
    current_user_language_array << current_user.profile.tecnhical.language_3
    
    profile_user_language_array = []
    profile_user_language_array << Profile.find(id).technical.language_1
    profile_user_language_array << Profile.find(id).technical.language_2
    profile_user_language_array << Profile.find(id).technical.language_3

    if current_user_language_array[0] = profile_user_language_array[0]
      scoreL1 = 100
    elsif current_user_language_array[0] = profile_user_language_array[1]
      scoreL1 = 90
    elsif current_user_language_array[0] = profile_user_language_array[2]
      scoreL1 = 80
    end

    if current_user_language_array[1] = profile_user_language_array[0]
      scoreL2 = 70
    elsif current_user_language_array[1] = profile_user_language_array[1]
      scoreL2 = 90
    elsif current_user_language_array[1] = profile_user_language_array[2]
      scoreL2 = 50
    end

    if current_user_language_array[2] = profile_user_language_array[0]
      scoreL3 = 60
    elsif current_user_language_array[2] = profile_user_language_array[1]
      scoreL3 = 50
    elsif current_user_language_array[2] = profile_user_language_array[2]
      scoreL3 = 80
    end

    (scoreL1 + scoreL2 + scoreL3) / 270 # à variabiliser pour autoriser le changement de score

  end

  def score_style(id)
  # Objectif: definir un score_style en fonction du commit_slot
    case (Profile.find(id).technical.commit_slot - current_user.profile.technical.commit_slot).abs 
    when 0
      100
    when 1 
      75
    when 2 
      50
    when 3
      0
    end
  end

  def github_age_score(id)
    array = []
    difference = (Profile.find(id).technical.github_age - current_user.profile.technical.github_age).abs
    commun_goals_profile_sample.each do |element|
      array << Profile.find(element).technical.github_age # a factoriser en variable d'instance github_ag_max_score
    end
    array << current_user.profile.technical.github_age
    max_score = array.max
    (1-(difference/max_score)) * 100
  end

  def number_of_projects_score(id)
    array = []
    difference = (Profile.find(id).technical.number_of_projects - current_user.profile.technical.number_of_projects).abs
    commun_goals_profile_sample.each do |element|
      array << Profile.find(element).technical.number_of_projects
    end
    array << current_user.profile.technical.number_of_projects
    max_score = array.max
    (1-(difference/max_score)) * 100
  end

  def total_commits_score(id)
    array = []
    difference = (Profile.find(id).technical.total_commits - current_user.profile.technical.total_commits).abs
    commun_goals_profile_sample.each do |element|
      array << Profile.find(element).technical.total_commits
    end
    array << current_user.profile.technical.total_commits
    max_score = array.max
    (1-(difference/max_score)) * 100
  end

  def followers_score(id)
    array = []
    difference = (Profile.find(id).technical.followers - current_user.profile.technical.followers).abs
    commun_goals_profile_sample.each do |element|
      array << Profile.find(element).technical.followers
    end
    array << current_user.profile.technical.followers
    max_score = array.max
    (1-(difference/max_score)) * 100
  end

  def experience_score(id)
    (github_age_score(id) + number_of_projects_score(id) + total_commits_score(id) + followers_score(id)) / 4
  end

end