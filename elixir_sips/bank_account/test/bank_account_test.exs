defmodule BankAccountTest do
  use ExUnit.Case
  doctest BankAccount

  test "start off with 0 balance" do
    account = spawn_link(BankAccount, :start, [])
    verify_balance_is(0, account)
  end
  
  test "balance increases by amount of deposit" do
    account = spawn_link(BankAccount, :start, [])
    Process.send(account, {:deposit, 10}, [])
    assert verify_balance_is(10, account)
    # assert_receive({:balance, 10})
  end
  
  test "balance decreases by amount of withdrawal" do
    account = spawn_link(BankAccount, :start, [])
    Process.send(account, {:deposit, 20}, [])
    Process.send(account, {:withdraw, 10}, [])
    verify_balance_is(10, account)
  end
  
  def verify_balance_is(expected_balance, account) do
    Process.send(account, {:check_balance, self}, [])
    assert_receive({:balance, ^expected_balance})
  end
end
