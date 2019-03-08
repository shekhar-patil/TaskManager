class TaskPolicy
  attr_reader :user, :tasks
  # , :tasks_created, :tasks_assigned

  def initialize(user, tasks)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @tasks = tasks
  end

  # CRUD actions
  def can_access_created_task?
    tasks.pluck(:creator_id).uniq == [user.id] || tasks.blank?
  end

  def can_access_assigned_task?
    tasks.pluck(:user_id).uniq == [user.id] || tasks.blank?
  end
end