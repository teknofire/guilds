class TimerPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  def index?
    user
  end

  def show?
    user.admin? || record.public? || user == record.user
  end

  def update?
    user.admin? || user == record.user
  end

  def reset?
    update? || shared_with?
  end

  def create?
    user
  end

  def destroy?
    user&.admin? || user == record.user
  end

  def share?
    user&.admin? || user == record.user
  end

  def shared_with?
    record.shared_members.include?(user)
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user&.admin?
        scope.all
      else
        scope.where(public: true).or(scope.where(user: user)).or(scope.where(id: user.shared_timer_ids))
      end
    end
  end
end
