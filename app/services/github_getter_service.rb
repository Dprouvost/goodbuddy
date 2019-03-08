require 'json'
require 'open-uri'

# GithubGetterService.get_name(userid)

class GithubGetterService < ApplicationController

  class << self

    def get_name(userid)
      url = "https://api.github.com/users/" << userid
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)
      return user['name']
    end

    def get_age(userid)
      url = "https://api.github.com/users/" << userid
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)
      return Date.today.mjd - DateTime.parse(user['created_at']).to_date.mjd
    end

    def get_languages(userid)
      url = "https://api.github.com/users/" << userid << "/repos?per_page=100"
      user_serialized = open(url).read
      details = JSON.parse(user_serialized)
      languages_array = []
      details.each_with_index { |val,index| languages_array.push(details[index]['language']) }
      counts_hash = Hash.new(0)
      languages_array.each { |name| counts_hash[name] += 1 }
      array1 = counts_hash.sort_by {|_key, value| -value }
      return [array1[0][0], array1[1][0], array1[2][0]]
    end

    def get_commit_slot(userid)
      url = "https://api.github.com/users/" << userid << "/events?per_page=100"
      user_serialized = open(url).read
      details = JSON.parse(user_serialized)
      slot_array = []
      details.each do |event|
        hour = DateTime.parse(event['created_at']).hour
        case hour
        when 0..6
          time_slot = 4
        when 7..12
          time_slot = 1
        when 13..18
          time_slot = 2
        when 19..24
          time_slot = 3
        end
        slot_array.push(time_slot)
      end
      counts = Hash.new(0)
      slot_array.each { |slot| counts[slot] += 1 }
      return counts.first[0]
    end

    def get_total_commits(userid)
      url = "https://api.github.com/users/" << userid << "/events?per_page=100"
      user_serialized = open(url).read
      details = JSON.parse(user_serialized)
      push_count = 0
      details.each do |event|
        push_count += 1 if event['type'] != "PushEvent" || event['type'] == "PullRequestEvent"
      end
      return push_count
    end

    def get_followers(userid)
      url = "https://api.github.com/users/" << userid
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)
      return user['followers']
    end

    def get_number_of_projects(userid)
      url = "https://api.github.com/users/" << userid
      user_serialized = open(url).read
      user = JSON.parse(user_serialized)
      return user['public_repos']
    end
  end
end
