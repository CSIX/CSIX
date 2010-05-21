# This file states which users can access what features of the site.
# If it is not stated here, a user does not have access to that feature

authorization do
  role :admin do
    has_permission_on :home, :about, :to => :index
    has_permission_on :users, :to => [:new, :create, :edit]
    has_permission_on :user_sessions, :to => [:new, :create, :destroy, :edit]
  end
  
  role :user do
    has_permission_on :home, :about, :to => :index
    has_permission_on :users, :to => [:new, :create, :edit]
    has_permission_on :user_sessions, :to => [:new, :create, :destroy, :edit]
  end
  
  role :guest do
    has_permission_on :home, :about, :to => :index
    has_permission_on :users, :to => [:new, :create,]
    has_permission_on :user_sessions, :to => [:new, :create, :destroy, :edit]
  end
end