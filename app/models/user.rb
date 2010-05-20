class User < ActiveRecord::Base
  # This line is required by Authlogic
  acts_as_authentic
  belongs_to :role
  
  # Returns the users role
  # This is used by the Declarative Authentication Gem
  def role_symbols
    return [role.name.to_sym]
  end
end
