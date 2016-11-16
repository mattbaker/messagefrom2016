RSpec.describe UserMailer do
  describe "confirm" do
    let(:message) { Message.new(email_address: "test@example.com", auth_token: "FOOBAR") }

    it "sets the correct sender and recipient" do
      mail = UserMailer.confirm(message)
      expect(mail.to).to eq([message.email_address])
      expect(mail.from).to eq(["welcome@messagefrom2016.com"])
    end

    it "renders the body" do
      mail = UserMailer.confirm(message)
      expect(mail.body.encoded).to include(message_confirm_url(message.auth_token))
    end
  end
end
