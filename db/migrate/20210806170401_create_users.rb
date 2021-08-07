class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.string :username
      t.text :info
      t.text :image_data

      t.timestamps
    end
  end
end
