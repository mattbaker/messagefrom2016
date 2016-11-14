class AddAuthorizedToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :authorized, :boolean, default: false
  end
end
