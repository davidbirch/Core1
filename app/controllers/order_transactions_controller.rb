class OrderTransactionsController < ApplicationController
  
  # GET /order_transactions
  # GET /order_transactions.json
  def index
    @order_transactions = OrderTransaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_transactions }
    end
  end

  # GET /order_transactions/1
  # GET /order_transactions/1.json
  def show
    @order_transaction = OrderTransaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_transaction }
    end
  end

end
