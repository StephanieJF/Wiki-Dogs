class WikiPolicy < ApplicationPolicy
  attr_reader :user, :record
  def index?
    false
  end

  def show
    false
  end

  def new
    user.present?
  end

  def create?
    user.present?
  end

  def edit
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user == record.user || user.role == 'admin'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all # if the user is an admin, show them all the wikis
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user_id == user.id || wiki.collaborators.include?(user.email)
            wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
          end
        end
      else # this is the lowly standard user
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.collaborators.include?(user.email)
            wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
          end
        end
      end
      wikis # return the wikis array we've built up
    end
  end
end