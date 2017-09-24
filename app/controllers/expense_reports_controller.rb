class ExpenseReportsController < ApplicationController
  def index
    result_null_expense_reports = ExpenseReport.all.where(vote_result: nil).where("vote_deadline <= ?", DateTime.now)
    result_null_expense_reports.each do |expense_report|
      pro_num = expense_report.votes.where(procon: true).count
      con_num = expense_report.votes.where(procon: false).count
      if pro_num >= con_num
        expense_report.update_attributes(vote_result: true)
      else
        expense_report.update_attributes(vote_result: false)
      end
    end

    @expense_reports = ExpenseReport.all
  end

  def new
    @expense_report = ExpenseReport.new(
      vote_deadline: DateTime.now + 15.minutes,
      eth_send_expect_date: DateTime.now.end_of_month
    )
  end

  def create
    # TODO: 補償金申請をEthereumNetworkへ送信するロジックを追加すること．
    expence_report = ExpenseReport.new(permit_params.merge({transfer_result: false}))
    expence_report.save

    flash[:notice] = '補償金申請が成功しました．'
    redirect_to user_expense_reports_path(current_user)
  end

  def show
    if ExpenseReport.find(vote_params[:id]).vote_deadline < DateTime.now
      flash[:notice] = '投票期日を過ぎています'

      redirect_to user_expense_reports_path(current_user)
      return
    end

    if current_user.votes.where(expense_report_id: vote_params[:id]).present?
      flash[:notice] = 'すでに投票済みです'
      redirect_to user_expense_reports_path(current_user)
    end

    @expense_report_id = vote_params[:id]
  end

  def update
    vote = Vote.new(user_id: vote_params[:user_id], expense_report_id: vote_params[:id], procon: procon_params[:procon])
    vote.save

    flash[:notice] = '投票が完了しました'
    redirect_to user_expense_reports_path(current_user)
  end

  private

  def permit_params
    params.required(:expense_report).permit(:created_at, :vote_deadline, :eth_send_expect_date, :content, :image, :amount, :address)
  end

  def vote_params
    params.permit(:user_id, :id)
  end

  def procon_params
    params.permit(:procon)
  end
end
