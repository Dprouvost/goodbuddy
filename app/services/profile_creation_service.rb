
# ProfileCreationService.ProfileCreation("Meyclem")

class ProfileCreationService

  def initialize(nickname, profile_user)
    @current_user = profile_user
    @nickname = nickname
  end

  def call
    infos = GithubGetterService.new(@nickname).call
    p = Profile.new(infos[:profile])
    p.user = @current_user
    p.save
    # p infos
    t = Technical.new(infos[:technicals])
    t.profile = p
    t.save
    p p
    p t
  end

end