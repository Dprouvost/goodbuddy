require 'json'
require 'open-uri'

# GithubGetterService.get_name(userid)

class GithubGetterService
  def initialize(nickname)
    @nickname = nickname
    @base_url = "https://api.github.com/users/" << @nickname
    @languages = nil
  end

  def call
    url = @base_url
    user_data = open(url).read
    user = JSON.parse(user_data)
    @languages = get_languages
    return {
      profile: {
        nickname: @nickname,
        picture: user["avatar_url"]
      },
      technicals: {
        language_1: @languages[:language_1],
        language_2: @languages[:language_2],
        language_3: @languages[:language_3],
        commit_slot: get_commit_slot,
        github_age: Date.today.mjd - DateTime.parse(user['created_at']).to_date.mjd,
        number_of_projects: user['public_repos'],
        total_commits: get_total_commits,
        followers: user['followers'],
      }
    }
  end

  def get_languages
    url = @base_url << "/repos?per_page=100"
    user_serialized = open(url).read
    details = JSON.parse(user_serialized)
    languages_array = []
    details.each_with_index { |val,index| languages_array.push(details[index]['language']) }
    counts_hash = Hash.new(0)
    languages_array.each { |name| counts_hash[name] += 1 }
    array1 = counts_hash.sort_by {|_key, value| -value }
    @languages = language_formater(array1)
  end

  def language_formater(arr)
    {
      language_1: arr[0] ? arr[0][0] : nil,
      language_2: arr[1] ? arr[1][0] : nil,
      language_3: arr[2] ? arr[2][0] : nil,
    }
  end

  def get_commit_slot
    url = @base_url << "/events?per_page=100"
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

  def get_total_commits
    url = @base_url << "/events?per_page=100"
    user_serialized = open(url).read
    details = JSON.parse(user_serialized)
    push_count = 0
    details.each do |event|
      push_count += 1 if event['type'] != "PushEvent" || event['type'] == "PullRequestEvent"
    end
    return push_count
  end
end
