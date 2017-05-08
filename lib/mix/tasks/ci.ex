defmodule Mix.Tasks.Ci do
  @moduledoc false

  use Mix.Task

  @shortdoc "Run dogma and tests together."
  def run(_) do
    Mix.shell.info "\n\e[35mRunning dogma:\e[0m"
    Mix.Tasks.Dogma.run([])

    Mix.shell.info "\n\e[35mRunning exunit:\e[0m\n"
    Mix.Tasks.Test.run(~w[--color --cover --trace])
  end
end
