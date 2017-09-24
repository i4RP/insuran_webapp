class InsurancesController < ApplicationController
  def index
  end

  def new
    @current_applicants_num = Forms::UserWallet.get_applicants_length
    expense_reports = ExpenseReport.where("vote_deadline >= ? ", DateTime.now.beginning_of_month).where("vote_deadline <= ? ", DateTime.now.end_of_month).where(transfer_result: 0).where(vote_result: 1)
    @total_amount = expense_reports.sum(:amount)
  end

  def create
    if permit_params[:type] == 'applicant'
      user = User.find(permit_params[:user_id])
      Forms::UserWallet.set_applicant(user.ethereum_wallet_address)
    else
      user = User.find(permit_params[:user_id])
      Forms::UserWallet.unsubscribe_from_insurance(user.ethereum_wallet_address)
    end

    redirect_to user_path(user)
  end

  def update
    expense_report = ExpenseReport.find(transfer_params[:expense_report_id])

    Forms::Verify.exec_transfer(transfer_params[:address], transfer_params[:amount])
    expense_report.update(transfer_result: true)

    flash[:notice] = '送金トランザクションを作成しました．(送金の承認までには時間がかかります)'
    redirect_to user_expense_reports_path(current_user)
  end

  private

  def permit_params
    params.permit(:user_id, :type)
  end

  def transfer_params
    params.permit(:address, :amount, :expense_report_id)
  end
end
