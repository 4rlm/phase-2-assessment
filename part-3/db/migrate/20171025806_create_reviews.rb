class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
			t.integer :restaurant_id, null: false
			t.integer :rating, null: false
			t.string :description, null: false

      t.timestamps null: false
    end
  end
end
