class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :organization_name
      t.text :description
      t.string :address
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 5
      t.string :web_url
      t.string :contact_phone
      t.string :fees
      t.text :schedule

      t.timestamps
    end
  end
end
