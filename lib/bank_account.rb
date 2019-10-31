class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    def initialize(name, balance=1000, status="open")
        @name = name
        @balance = balance
        @status = status
    end
    def deposit(money)
        self.balance += money
    end
    def display_balance
        "Your balance is $#{balance}."
        # self.balance
    end
    def valid?
        @status == "open" && balance > 0 == true
    end
    def close_account
        @status  = "closed"
    end
end
