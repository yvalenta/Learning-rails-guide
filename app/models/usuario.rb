class Usuario < ActiveRecord::Base

  def self.authenticate(email, password)
    find_by(email: email, password: password) || false
  end

end
