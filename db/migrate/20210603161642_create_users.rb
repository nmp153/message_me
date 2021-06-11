class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      #has to be password_digest to use bcrypt gem to hash the passwords
      t.string :password_digest
      t.timestamps
    end
  end
end
