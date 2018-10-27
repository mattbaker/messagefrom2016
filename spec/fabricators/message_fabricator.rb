Fabricator(:message) do

    content { Faker::HitchhikersGuideToTheGalaxy.quote }
    email_address { Faker::Internet.email }
    zip { %w(60614 60657 60640 60660).sample }
    sent { false }
  end