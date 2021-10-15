class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :body
      t.string :ingredients
      t.integer :recommendations, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
