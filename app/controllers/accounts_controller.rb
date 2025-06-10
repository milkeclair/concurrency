class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
    Account.ten.each do |account|
      Thread.new do
        account.pool_exclusive_process(duration: 3)
      end
    end
  end
end
