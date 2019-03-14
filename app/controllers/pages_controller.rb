class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def location 
    
    @profile = current_user.profile
  end 

  # def select_location
    
  # end

  def choose_pictures
    @profile = current_user.profile
    @profile.location = params["profile"]["location"]
    @profile.save
    @main_categories = Category.where(category_id: nil, stamp: 'social')
    # @categories = Category.where(stamp: 'goal')
    # @profile = Profile.find(3)

    @pic_titles = ["Would you rather chill out with friends or go to gigs?", "Would you rather go to the cinema or watch netflix?", "Would you rather eat a burger or a salad?", "Are you an organized or a disorganized type of person?"]
    @first_options = ["1", "2", "3", "4"]
    # @second_options =
  end

  def select_goals
    @categories = Category.where(stamp: 'goal')
    @profile = current_user.profile
    @profile.categories = params["socials"]["categories"]
      .split(",")
      .reject(&:empty?) #arr.reject { |item| item.empty? }
      .uniq
      .map do |id|
        Category.find(id.to_i)
      end
    @profile.save
    @profile = Profile.find(params["id"])
  end

  def select_w
    # @profile = Profile.find(params["id"])
    @profile = current_user.profile
    @profile.categories += params["goals"]["categories"]
      .split(",")
      .reject(&:empty?) #arr.reject { |item| item.empty? }
      .uniq
      .map do |id|
        Category.find(id.to_i)
      end
    @profile.description = params["profile"]["description"]
    @profile.save
  end

  

end
