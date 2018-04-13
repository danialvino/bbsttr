class ChangeBankInfosToString < ActiveRecord::Migration[5.1]
  def change
    change_column :bank_infos, :agency, :string
    change_column :bank_infos, :account, :string
    change_column :bank_infos, :cpf, :string
  end
end
