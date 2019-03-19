class TaskPolicy
  attr_reader :user, :task

  def initialize(user, task)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @task = task
  end

  # show? action is invoked when we call `authorize @task` in show action of the controller.
  # Here the condition that we want to check is whether the record's creator is current user or record is assigned to current user.
  def show?
    task.creator_id == user.id || task.assignee_id == user.id
  end

  # The condition to make sure a task is editable is the same as that of the show action.
  # So all we'll do is simply call `show?` inside
  def edit?
    show?
  end

  # Similar is the case for update?
  def update?
    show?
  end

  # Every user can create a task, hence create? will always return true
  def create?
    true
  end

  # Only the user that has created the task and delete it
  def destroy?
    task.creator_id == user.id
  end

  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(creator_id: user.id).or(scope.where(assignee_id: user.id))
    end
  end
end