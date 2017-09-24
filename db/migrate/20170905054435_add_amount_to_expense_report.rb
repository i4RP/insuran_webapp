class AddAmountToExpenseReport < ActiveRecord::Migration[5.1]
  def change
    add_column :expense_reports, :amount, :string
  end
end
