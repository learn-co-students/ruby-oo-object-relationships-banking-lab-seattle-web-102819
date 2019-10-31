



class Transfer

  attr_reader :sender, :receiver
  attr_accessor  :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount =  amount
  end

  def valid?
if @sender.valid? && @receiver.valid?
  return true
else
  return false
end
   end

   def execute_transaction
    if @status == "pending" && self.valid? && @status != "complete" && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @status != "pending" && @status != "rejected"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end


end
