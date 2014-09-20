class Usuario < ActiveRecord::Base

  EMAIL_REGEX = /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+/

  def self.authenticate(email, password)
    p EMAIL_REGEX.match(email)
    usuario = if EMAIL_REGEX.match(email)
                p "email"
                find_by(email: email, password: password)
              else
                p "apodo"
                p email
                p password
                find_by(apodo: email, password: password)
              end

    usuario || false
  end

end
