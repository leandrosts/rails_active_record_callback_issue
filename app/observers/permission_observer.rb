class PermissionObserver < ActiveRecord::Observer
  cattr_accessor :called

  def after_commit(permission)
    self.class.called ||= 0
    self.class.called += 1
  end
end