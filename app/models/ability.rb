class Ability
  include CanCan::Ability
    # See the wiki for details: https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

  def initialize(user)
    @user = user || User.new 
    @user.roles.each { |role| send(role) }
    if @user.roles.empty?
        can :read, :all
    end
  end

  def admin
    can :manage, :all
  end

  def moderator
    contributer
    can :update, Pic
  end

  def contributer
    viewer
    can :create, Pic
    can :update, Pic do |pic|
        pic.try(:user) == @user
    end
  end

  def viewer
    can :read, :all
    can :update, Pic => :tag_list
  end

  def banned
    cannot :access, :all 
  end

end