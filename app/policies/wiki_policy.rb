class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki
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
    user == wiki.user || user.role == 'admin'
  end

  private

  def wiki
    record
  end
end