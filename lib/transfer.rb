require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status 
  end 

  def valid?
    @sender.valid? && @receiver.valid? ==  true
  end 


    def execute_transaction
      if !self.valid? || @status == "complete" || @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else 
        @sender.balance -= @amount
        @receiver.balance += @amount
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