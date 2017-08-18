class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.integer :otp
      t.datetime :otp_expiry
      t.string :access_token

      t.timestamps null: false
    end
  end
end
