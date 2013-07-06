class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :activity_type, null: false
      t.integer :fitness_amount
      t.integer :dollars_per_person
      t.integer :creator_id
      t.timestamps
    end
  add_index :challenges, :creator_id
  end
end