class CreateReviewssitters < ActiveRecord::Migration[5.1]
  def change
    create_table :reviewssitters do |t|
      t.text :description
      t.float :rating
      t.references :user, foreign_key: true
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
