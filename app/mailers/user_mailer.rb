class UserMailer < ApplicationMailer
  def confirm(message)
    @auth_token = message.auth_token

    mail(
      :subject => message.subject,
      :to      => message.email_address,
      :from    => "welcome@#{Rails.application.config.production_domain}",
      :tag     => 'activation-tag',
      :track_opens => 'true'
    )
  end
end
