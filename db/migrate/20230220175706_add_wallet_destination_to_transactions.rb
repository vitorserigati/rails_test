class AddWalletDestinationToTransactions < ActiveRecord::Migration[7.0]
  def change
    change_table(:transactions) do |t|
      t.rename :type, :transfer_type
      t.rename :wallet_id, :from_wallet_id
      t.belongs_to :to_wallet, foreign_key: { to_table: :wallets }, type: :uuid, null: false
    end
  end
end
