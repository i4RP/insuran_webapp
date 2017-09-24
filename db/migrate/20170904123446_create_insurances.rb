class CreateInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :insurances do |t|
      t.integer :EntryNum
      t.string :Amount
      t.datetime :DeadLine

      t.timestamps
    end
  end
end
