require_relative 'bank_account'

RSpec.describe BankAccount do
  describe "#deposit" do
    it "increases the balance by the deposit amount" do
      bank_account = BankAccount.new(100)
      deposit_amount = 50
      bank_account.deposit(deposit_amount)
      expect(bank_account.balance).to eq(100 + deposit_amount)
    end
  end

  describe "#withdraw" do
    context "with sufficient funds" do
      it "decreases the balance by the withdrawal amount" do
        bank_account = BankAccount.new(100)
        withdrawal_amount = 50
        bank_account.withdraw(withdrawal_amount)
        expect(bank_account.balance).to eq(100 - withdrawal_amount)
      end
    end

    context "with insufficient funds" do
      it "does not change the balance" do
        bank_account = BankAccount.new(100)
        withdrawal_amount = 150
        bank_account.withdraw(withdrawal_amount)
        expect(bank_account.balance).to eq(100)
      end
    end
  end

  describe "#balance" do
    it "returns the current balance" do
      bank_account = BankAccount.new(100)
      expect(bank_account.balance).to eq(100)
    end
  end
end
