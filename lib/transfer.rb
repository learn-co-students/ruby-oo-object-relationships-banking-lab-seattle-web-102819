require 'pry'
class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
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
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
  end

    def reverse_transfer
      if self.valid? && @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end
    end

end
