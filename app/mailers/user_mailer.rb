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

  def send_message_from_2016(message)
    @message = message

    mail(
      :subject => "Your Message from 2016",
      :to      => message.email_address,
      :from    => "welcome@#{Rails.application.config.production_host}",
      :tag     => '2016to2018',
      :track_opens => 'true'
    )
  end
end
