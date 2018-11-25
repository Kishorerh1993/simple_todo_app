class TodoPolicy
  attr_reader :user, :todo

  def initialize(user, todo)
    @user = user
    @todo = todo
  end

  def index?
    !user.nil?
  end

  def completed?
    !user.nil?
  end

  def active?
    !user.nil?
  end

  def new?
    !user.nil?
  end

  def mark_complete?
    !user.nil? && todo.user == user
  end

  def create?
    !user.nil?
  end

  def destroy?
    !user.nil? && todo.user == user
  end
end