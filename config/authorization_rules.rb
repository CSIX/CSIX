authorization do
  role :admin do
    has_permission_on :user, :to => [:new, :create, :edit, :update]
    has_permission_on :user_session, :to => [:create, :destroy]
  end
  
  role :user do
    has_permission_on :user, :to => [:new, :create, :edit, :update]
    has_permission_on :user_session, :to => [:create, :destroy]
  end
  
  role :guest do
    has_permission_on :home, :about, :to => :index
    has_permission_on :user, :to => [:index, :new, :create]
  end
end