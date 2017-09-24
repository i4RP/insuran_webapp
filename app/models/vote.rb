class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :expense_report
end
