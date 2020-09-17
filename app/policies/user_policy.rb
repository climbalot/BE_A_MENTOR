class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def myprofile?
    record == user
  end

  def update?
    record == user
  end

  def destroy?
    record == user
  end
end
