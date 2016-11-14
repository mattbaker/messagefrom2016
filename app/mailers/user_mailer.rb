class UserMailer < ApplicationMailer
  def confirm(message)
    @auth_token = message.auth_token

    mail(
      :subject => 'Confirm your Message from 2016',
      :to      => message.email,
      :from    => 'welcome@messagefrom2016.com',
      :tag     => 'activation-tag',
      :track_opens => 'true'
    )
  end
end
