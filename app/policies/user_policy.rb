class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == @user
  end

  def destroy?
    return true if user.present? && user == @user
  end

  private

  def user
    record
  end
end