class InvoicesController < ApplicationController
  def accounting_info
    @user = User.find(params[:id])
  end

  def add_accounting_info
  end
end
