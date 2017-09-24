class CreateExpenseReports < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_reports do |t|
      t.datetime :vote_deadline
      t.text :content
      t.boolean :vote_status
      t.boolean :vote_result
      t.datetime :eth_send_expect_date
      t.string :image

      t.timestamps
    end
  end
end
