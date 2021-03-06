RSpec::Matchers.define :require_login do
  match do |actual|
    redirect_to Rails.application.routes.url_helpers.new_sesion_path
  end

  failure_message do |actual|
    "Se esperaba redireccion a inicio de sesion"
  end

  failure_message_when_negated do |actual|
    "NO se esperaba redireccion a inicio de sesion"
  end

  describe do
    "Redireccion al formulario de sesion"
  end

end