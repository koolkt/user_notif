require 'rails/generators/base'

class UserNotifGenerator < Rails::Generators::NamedBase
  desc 'This generator creates a new notification model with his associated files'

  source_root File.expand_path('../templates', __FILE__)

  argument :target, type: :string

  def copy_files
    template 'notif.rb.erb', "app/models/notifications/#{file_name}_notif.rb"
    template 'notif_email.text.erb', "app/views/notifications/mailer/#{file_name}_notif.html.erb"
    template 'notif_email.text.erb', "app/views/notifications/mailer/#{file_name}_notif.text.erb"
    copy_file 'small_notif_view.html.erb', "app/views/notifications/small/#{file_name}_notif.html.erb"
    copy_file 'full_notif_view.html.erb', "app/views/notifications/full/#{file_name}_notif.html.erb"
  end
end