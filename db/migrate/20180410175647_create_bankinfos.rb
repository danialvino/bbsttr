class CreateBankinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :bankinfos do |t|
      t.integer :agency
      t.integer :account
      t.string :bank
      t.integer :cpf
      t.references :sitter, foreign_key: true

      t.timestamps
    end
  end
end
