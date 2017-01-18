Given /I am signed in as an admin/ do
  visit '/users/sign_up'
  fill_in "Username | Usuario", :with => 'admin'
  fill_in "Email | Correo electrónico", :with => 'admin@example.com'  
  fill_in "Name | Nombre", :with => 'Admin Admin'
  fill_in "Password | Contraseña", :with => 'admin1234'
  fill_in "Password Confirmation | Confirmación de contraseña", :with => 'admin1234'
  click_button "Sign up | Regístrate"
  step %Q{I should see "admin"}
end