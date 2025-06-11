class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])

    4.times do
      PoolExclusiveJob.perform_later
    end

    Account.five.each do |account|
      Thread.new do
        account.pool_exclusive_process(duration: 20)
      end
    end
  end
end
