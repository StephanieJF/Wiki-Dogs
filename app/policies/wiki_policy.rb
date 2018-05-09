class WikiPolicy < ApplicationPolicy
  attr_reader :user, :record
  def index?
    user.present?
  end

  def show
    user.present?
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