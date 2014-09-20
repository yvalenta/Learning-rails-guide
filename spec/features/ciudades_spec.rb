require 'rails_helper'
feature 'Administracion de ciudades' do
  feature 'Usuario con sesion activa' do
    background do
      @usuario = create(:usuario)
      page.driver.post sesiones_path, :correo => @usuario.email, :clave => @usuario.password
    end

    scenario 'Listar ciudades'

    scenario 'Crear una ciudad' do
      visit ciudades_path
      expect(current_path).to eq ciudades_path
      click_on 'New Ciudad'
      expect(current_path).to eq new_ciudad_path

     expect{
       fill_in 'Nombre', with: 'Antioquia'
       fill_in 'Cod dane', with: '12345'
       click_on 'Create Ciudad'
       save_and_open_page
     }.to change(Ciudad, :count).by(1)
      expect(page).to have_content('Ciudad was successfully created')

    end

  end

end
