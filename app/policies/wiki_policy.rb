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
end