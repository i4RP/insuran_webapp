class AddAddressToExpenseReport < ActiveRecord::Migration[5.1]
  def change
    add_column :expense_reports, :address, :string
  end
end
