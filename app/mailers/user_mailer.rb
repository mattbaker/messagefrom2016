class UserMailer < ApplicationMailer
  def confirm(message)
    @auth_token = message.auth_token

    mail(
      :subject => "Confirm your email with Message From 2016",
      :to      => message.email_address,
      :from    => "welcome@#{Rails.application.config.production_host}",
      :tag     => 'activation-tag',
      :track_opens => 'true'
    )
  end
end
