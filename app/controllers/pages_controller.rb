class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def select_goals
    @categories = Category.where(stamp: 'goal')
    @profile = Profile.find(3)
    # @profile = Profile.find_by(user: current_user)
  end

  def select_w
    @profile = Profile.find(params["id"])
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
