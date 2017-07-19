ActiveAdmin.setup do |config|
  config.authentication_method = :authenticate_admin_user!
  config.batch_actions = true
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.localize_format = :long
  config.register_javascript 'https://www.google.com/jsapi'
  config.site_title = 'Eaton Firmware Management'
  config.site_title_link = '/'
end
