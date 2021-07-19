class CreateLikedAnimalsJoin < ActiveRecord::Migration[6.1]
  def change
    create_table :liked_animals_users do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
