ExUnit.start()

ExUnit.configure exclude: [integration: true]

defmodule TestHelper do
  def get_bootstrap_hosts do
    Mix.Config.read!("config/config.exs") |> hd |> elem(1) |> hd |> elem(1)
  end

  def generate_random_string(string_length \\ 20) do
    :random.seed(:os.timestamp)
    Enum.map(1..string_length, fn _ -> (:random.uniform * 25 + 65) |> round end) |> to_string
  end
end
