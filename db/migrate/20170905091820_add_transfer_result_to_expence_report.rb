class AddTransferResultToExpenceReport < ActiveRecord::Migration[5.1]
  def change
    add_column :expense_reports, :transfer_result, :boolean, null: false
  end
end
