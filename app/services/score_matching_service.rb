
# total_score_ordered = ScoreMatchingService.new(social_weight: 2, style_weight: 3, ..., current_user: current_user).call

class ScoreMatchingService

  def initialize(attrs)
    @social_weight = attrs[:social_weight]
    @language_weight = attrs[:language_weight]
    @style_weight = attrs[:style_weight]
    @experience_weight = attrs[:experience_weight]
    @current_user = attrs[:current_user]
    # @goals = Category.goals
    # @main_socials = Category.main_socials
    # @sub_socials = Category.sub_socials
    @max_github_age = 0
    @max_number_of_projects = 0
    @max_total_commits = 0
    @max_followers = 0
    #3 - Déterminer les pondérations
    @goal_weight = 0.5 * (@social_weight + @language_weight + @style_weight + @experience_weight)
  end

  def call
  #1 - Profils comparables (au moins un goal en commun)
    @profiles = commun_goals_profile_sample
  #2 - Déterminer les max values
    max_values
  #3 - Affiler un score à chacun des profils comparables
    @profiles.map! do |profile|
      score = calculate_score(profile)
      {
        score: score,
        profile: profile
      }
    end
    # puts ' '
    # puts ' '
    # puts ' '
    # puts "PROFILE NUMBER #{@profiles.count}"
    # puts ' '
    # puts ' '
    # puts ' '  
    p @profiles
    @profiles.sort_by {|e| -e[:score][:total]}
  end

  private

  def calculate_score(profile)
    # score = 0
    if profile.technical
      sg = score_goal(profile.id)
      sc = score_social(profile.id)
      sl = score_language(profile.id)
      ss = score_style(profile.id)
      se = (score_github_age(profile.id) + score_number_of_projects(profile.id) + score_total_commits(profile.id) + score_followers(profile.id))/4.0
      score = ((@goal_weight * sg) + (@social_weight * sc) + (@language_weight * sl) + (@style_weight * ss) + (@experience_weight * se)) / (@goal_weight + @social_weight + @language_weight + @style_weight + @experience_weight)
    end
    {
      total: score || 0,
      goal: sg || 0,
      social: sc || 0,
      language: sl || 0,
      style: ss || 0,
      experience: se || 0
    }
  end

  def commun_goals_profile_sample
    goals = @current_user.profile.categories.where(stamp: 'goal')
    goals.map do |category|
      category.profiles.where.not(id: @current_user.profile.id)
    end.flatten.uniq
  end

  def max_values
    @profiles.each do |profile|
      if profile.technical
        profile.technical.github_age > @max_github_age ? @max_github_age = profile.technical.github_age : @max_github_age = @max_github_age
        profile.technical.number_of_projects > @max_number_of_projects ? @max_number_of_projects = profile.technical.number_of_projects : @max_number_of_projects = @max_number_of_projects
        profile.technical.total_commits > @max_total_commits ? @max_total_commits = profile.technical.total_commits : @max_total_commits = @max_total_commits
        profile.technical.followers > @max_followers ? @max_followers = profile.technical.followers : @max_followers = @max_followers
      end
    end
  end

  def score_goal(id)
    # Objectif: definir un score_goal en fonction du nombre de goals en commun
      (((Profile.find(id).categories.where(stamp: 'goal') & @current_user.profile.categories.where(stamp: 'goal')).count).to_f/((@current_user.profile.categories.where(stamp: 'goal')).count).to_f)*100
  end

  def score_social(id)
  # Objectif: definir un score_social en fonction du nombre de socials en commun
    if Profile.find(id).categories.where(stamp: 'social') == []
      0.0
    elsif @current_user.profile.categories.where(stamp: 'social') == []
      0.0
    else
    (((Profile.find(id).categories.where(stamp: 'social') & @current_user.profile.categories.where(stamp: 'social')).count).to_f/((@current_user.profile.categories.where(stamp: 'social')).count).to_f)*100
    end
  end

  def score_language(id)
  # Objectif: definir un score_language en fonction du nombre de language en commun mais aussi de leur ordre
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
    
      current_user_language_array = []
      current_user_language_array << @current_user.profile.technical.language_1
      current_user_language_array << @current_user.profile.technical.language_2
      current_user_language_array << @current_user.profile.technical.language_3
      
      profile_user_language_array = []
      profile_user_language_array << Profile.find(id).technical.language_1
      profile_user_language_array << Profile.find(id).technical.language_2
      profile_user_language_array << Profile.find(id).technical.language_3

      if profile_user_language_array.include?(current_user_language_array[0]) == false 
        scoreL1 = 0
      elsif current_user_language_array[0] == profile_user_language_array[0]
        scoreL1 = 100
      elsif current_user_language_array[0] == profile_user_language_array[1]
        scoreL1 = 90
      elsif current_user_language_array[0] == profile_user_language_array[2]
        scoreL1 = 80
      end

      if profile_user_language_array.include?(current_user_language_array[1]) == false
        scoreL2 = 0
      elsif current_user_language_array[1] == profile_user_language_array[0]
        scoreL2 = 70
      elsif current_user_language_array[1] == profile_user_language_array[1]
        scoreL2 = 90
      elsif current_user_language_array[1] == profile_user_language_array[2]
        scoreL2 = 50
      end

      if profile_user_language_array.include?(current_user_language_array[2]) == false
        scoreL3 = 0
      elsif current_user_language_array[2] == profile_user_language_array[0]
        scoreL3 = 60
      elsif current_user_language_array[2] == profile_user_language_array[1]
        scoreL3 = 50
      elsif current_user_language_array[2] == profile_user_language_array[2]
        scoreL3 = 80
      end

      (((scoreL1 + scoreL2 + scoreL3).to_f/270.0).to_f)*100
    else
      0.0
    end
  end

  def score_style(id)
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
      case (Profile.find(id).technical.commit_slot - @current_user.profile.technical.commit_slot).abs 
      when 0
        100
      when 1 
        75
      when 2 
        50
      when 3
        0
      end
    else
      0.0
    end
  end

  def score_github_age(id)
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
       difference = (Profile.find(id).technical.github_age - @current_user.profile.technical.github_age).abs.to_f
       (1-(difference/@max_github_age.to_f)) * 100
    else
      0.0
    end
  end

  def score_number_of_projects(id)
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
      difference = (Profile.find(id).technical.number_of_projects - @current_user.profile.technical.number_of_projects).abs.to_f
      (1-(difference/@max_number_of_projects.to_f)) * 100
    else
      0.0
    end
  end

  def score_total_commits(id)
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
      p difference = (Profile.find(id).technical.total_commits - @current_user.profile.technical.total_commits).abs.to_f
      p (1-(difference/@max_total_commits.to_f)) * 100
    else
      0.0
    end
  end

  def score_followers(id)
    profile = Profile.find(id)
    technical = profile.technical if profile
    technical_user = @current_user.profile.technical
    if technical && technical_user
      difference = (Profile.find(id).technical.followers - @current_user.profile.technical.followers).abs.to_f
      max_f = (@max_followers.to_f < 1  ? 1 : @max_followers.to_f)  
      (1-(difference/max_f)) * 100
    else
      0.0
    end
  end

end