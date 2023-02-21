class AddColumnsToUser < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.rename :name, :first_name
      t.string :middle_name, null: false
      t.string :last_name, null: false
      t.string :cpf, null: false
      t.string :phone_number, null: false
    end
  end
end
