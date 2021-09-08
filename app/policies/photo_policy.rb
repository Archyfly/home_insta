class PhotoPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    return true if user.present? && user == post.user
  end

  def update?
    return true if user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && user == post.user
  end

  private

  def post
    record
  end
end