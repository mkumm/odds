defmodule Odds do
I try to fing error but I can not

  def play(simulation_count, bet, target, odds_per_win) do
    chances = 
    Enum.map(1..simulation_count, fn _x -> simulate(bet, target, odds_per_win) end)
    |> Enum.count(fn x -> x == true end)
    |> Kernel./(simulation_count) 

    IO.puts("You have a 1 in #{:erlang.float_to_binary(1/chances, [decimals: 1])} chance of winning")
  end

  def simulate(bet, target, odds_per_win) when bet < target do
    if simulate_hand(odds_per_win), do: simulate(bet*2, target, odds_per_win), else: false
  end

  def simulate(bet, target, _odds) when bet >= target, do: true

  def simulate_hand(odds) do
    if :random.uniform <= odds, do: true, else: false
  end

end
