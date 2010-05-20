class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :role
  
  def role_symbols
    @role_symbols ||= (role || []).map {|r| r.to_sym}
  end
end
