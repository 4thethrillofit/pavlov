class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :humanapi_token, null: false
      t.string :stripe_token
      t.string :email, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :users, :humanapi_token, unique: true
    add_index :users, :email, unique: true
  end
end