require 'pry'

class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if self.valid? && @sender.balance > @amount && @status == "pending"
    @sender.balance -= 50
    @receiver.balance += 50
    @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance." 
    end

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
      
  end

end
