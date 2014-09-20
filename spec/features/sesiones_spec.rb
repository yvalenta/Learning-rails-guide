require 'rails_helper'
feature 'Inicio de sesion' do
  background do
    @usuario = create(:usuario)
  end

  scenario 'Permite iniciar sesion con datos correctos' do
    visit new_sesion_path
    expect(current_path).to eq new_sesion_path

  end

end
