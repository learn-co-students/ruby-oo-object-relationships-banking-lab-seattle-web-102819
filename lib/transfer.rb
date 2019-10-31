require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if !self.valid? || @sender.balance < @amount || @status == "complete"
      @status = "rejected"
      return "Transaction rejected. Please check your account balance." 
    else 
      @sender.balance -= 50
      @receiver.balance += 50
      @status = "complete"
      
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