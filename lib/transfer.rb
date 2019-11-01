 require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if (status != "complete" && sender.valid? && receiver.valid? && sender.balance > amount)
        @sender.balance -= amount
        @receiver.balance += amount
        @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end

# trans_1 = Transfer.new(bob, dan, 60)

# bob = BankAccount.new("Bob")
# dan = BankAccount.new("Dan")