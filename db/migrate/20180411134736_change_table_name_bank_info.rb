class ChangeTableNameBankInfo < ActiveRecord::Migration[5.1]
  #  def self.up
  #   rename_table :bankinfos, :bank_infos
  # end

  def change
    rename_table :bankinfos, :bank_infos
  end
end
