class Transfer
  # your code here

  attr_reader :sender, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  # def valid?
  #   if @sender.valid? && @receiver.valid?
  #     return true
  #   else
  #     return false
  #   end
  # end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status != "complete" && self.valid? && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && valid? && receiver.balance > amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end

