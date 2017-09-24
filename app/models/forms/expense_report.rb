class Forms::ExpenseReport
  include ActiveModel::Model

  attr_accessor :created_at, :content, :vote_deadline, :vote_status, :vote_result, :eth_send_expect_date, :reciept
end
