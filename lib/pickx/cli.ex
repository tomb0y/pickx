defmodule Pickx.CLI do
  @moduledoc """
  Handles the command line parsing and the dispathch to
  the various functions that end up generating a
  table of the _n_ most recent commits in a github project
  """

  @num_of_commits 7

  @doc ~S"""
  `args` can be -h or --help, which returns :help.

  Otherwise it is a github user name, project name,
  and (optionally) the number of entries to forrmat.

  Returns a tuple of `{user, project, count}`,
  or :help, if help was given.

  ## Examples:

      iex> Pickx.CLI.parse_args(["-h", "whatever"]) # =>
      :help

      iex> Pickx.CLI.parse_args(["--help", "whatever"]) # =>
      :help

      iex> Pickx.CLI.parse_args(["github_user", "github_repo", "42"]) # =>
      {"github_user", "github_repo", 42}

      iex> Pickx.CLI.parse_args(["github_user", "github_repo"]) # =>
      {"github_user", "github_repo", 7}

      iex> Pickx.CLI.parse_args([]) # =>
      :help

  """
  def parse_args(args) do
    parsed_options = OptionParser.parse(args, switches: [help: :boolean], aliases: [h: :help])

    case parsed_options do
      {[help: true], _, _} -> :help
      {_, [user, repo, num_of_commits], _} -> {user, repo, String.to_integer(num_of_commits)}
      {_, [user, repo], _} -> {user, repo, @num_of_commits}
      _ -> :help
    end
  end
end
