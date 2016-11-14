class UserMailer < ApplicationMailer
  def confirm(message)
    @auth_token = message.auth_token

    mail(
      :subject => message.subject,
      :to      => message.email_address,
      :from    => 'welcome@messagefrom2016.com',
      :tag     => 'activation-tag',
      :track_opens => 'true'
    )
  end
end
