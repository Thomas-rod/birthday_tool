class FriendPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end

  def create?
    return true
  end

  def update?
    return true if record.user == current_user
  end

  def destroy?
    return true if record.user == current_user
  end
end
