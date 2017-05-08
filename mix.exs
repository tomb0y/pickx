defmodule Pickx.Mixfile do
  use Mix.Project

  @description """
    A simple command line tool that lists the newest commits of a given github repository.
  """

  def project do
    [app: :pickx,
     version: "0.1.0",
     elixir: "~> 1.4",
     name: "Pick X",
     description: @description,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: preferred_cli_env(),
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.1"},
      {:dogma, "~> 0.1", only: [:dev, :test]}
    ]
  end

  defp preferred_cli_env do
    [ci: :test]
  end
end
