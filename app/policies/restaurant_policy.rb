class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user)
      # scope is a restaurant
    end
  end

  def show?
    return true
  end

  def create?
    return true # all the user can create a resto
  end

  def update?
    # only the owner can update it
    # record => @restaurant
    # user => current_user
    # record.user == user
    user_is_owner_or_admin?
  end

  def destroy?
    # record.user == user
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user.admin || record.user == user
  end
end
