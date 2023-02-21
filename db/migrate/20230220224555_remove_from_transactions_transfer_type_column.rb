class RemoveFromTransactionsTransferTypeColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :transfer_type
  end
end
