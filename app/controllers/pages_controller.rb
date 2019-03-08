class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def choose_pictures
    # @categories = Category.where(stamp: 'goal')
    # @profile = Profile.find(3)
  end

  def select_goals
    @categories = Category.where(stamp: 'goal')
    @profile = current_user.profile
    # @profile = Profile.find(params["id"])
  end

  def select_w
    # @profile = Profile.find(params["id"])
    @profile = current_user.profile
    @profile.categories = params["goals"]["categories"]
      .split(",")
      .reject(&:empty?) #arr.reject { |item| item.empty? }
      .uniq
      .map do |id|
        Category.find(id.to_i)
      end
    p @profile
    p @profile.categories
    @profile.description = params["profile"]["description"]
    @profile.save
  end
end
