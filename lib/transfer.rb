require 'pry'

class Transfer
  attr_accessor(:status, :amount)
  attr_reader(:sender, :receiver)
  
  def initialize (sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true 
    else
      return false
    end
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount || @status == 'complete'
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end