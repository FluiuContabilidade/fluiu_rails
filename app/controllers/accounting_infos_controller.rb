class AccountingInfosController < ApplicationController

  def new
    @accounting_info = AccountingInfo.new()
    @user = current_user
  end

end
