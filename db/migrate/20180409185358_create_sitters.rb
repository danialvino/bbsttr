class CreateSitters < ActiveRecord::Migration[5.1]
  def change
    create_table :sitters do |t|
      t.integer :pay_rate
      t.text :about
      t.string :skills
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
