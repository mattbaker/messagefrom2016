class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :email_address
      t.string :subject
      t.text :content
      t.string :auth_token
      t.string :zip

      t.timestamps
    end
    add_index :messages, :auth_token, unique: true
  end
end
