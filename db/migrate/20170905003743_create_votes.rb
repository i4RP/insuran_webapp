class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :expense_report_id
      t.boolean :procon

      t.timestamps
    end
  end
end
