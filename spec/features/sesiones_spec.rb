require 'rails_helper'
feature 'Inicio de sesion' do
  background do
    @usuario = create(:usuario)
  end

  scenario 'Permite iniciar sesion con email y clave correctos' do
    visit new_sesion_path
    expect(current_path).to eq new_sesion_path

    fill_in 'Correo o apodo', with: @usuario.email
    fill_in 'clave', with: @usuario.password
    click_on 'Aceptar'
    expect(page).to have_content "Bienvenido !!"

  end

  scenario 'Permite iniciar sesion con nickname y clave correcta' do
    visit new_sesion_path
    expect(current_path).to eq new_sesion_path

    fill_in 'Correo o apodo', with: @usuario.apodo
    fill_in 'clave', with: @usuario.password
    click_on 'Aceptar'
    expect(page).to have_content "Bienvenido !!"

  end

  scenario 'NO permite iniciar sesion con datos incorrectos' do
    visit new_sesion_path
    expect(current_path).to eq new_sesion_path

    fill_in 'Correo o apodo', with: @usuario.email
    fill_in 'clave', with: 'ClaveFake'
    click_on 'Aceptar'
    expect(page).to have_content "Los datos son erroneos!!"
  end

end
