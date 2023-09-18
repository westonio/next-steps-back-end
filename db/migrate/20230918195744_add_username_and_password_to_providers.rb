class AddUsernameAndPasswordToProviders < ActiveRecord::Migration[7.0]
  def change
    add_column :providers, :username, :string
    add_column :providers, :password_digest, :string
  end
end
