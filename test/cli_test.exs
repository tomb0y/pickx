defmodule CLITest do
  use ExUnit.Case
  doctest Pickx.CLI

  import Pickx.CLI, only: [parse_args: 1]

  describe "#parse_args" do
    test "the -h option is parsed as :help" do
      assert parse_args(["-h", "whatever"]) == :help
    end

    test "the --help option is parsed as :help" do
      assert parse_args(["--help", "whatever"]) == :help
    end

    test "three values given are parsed as is, and returned" do
      assert parse_args(["user", "project", "42"]) == {"user", "project", 42}
    end

    test "two values given are parsed as is, and returned with the default commit number" do
      assert parse_args(["user", "project"]) == {"user", "project", 7}
    end

    test "other argument lists default to :help" do
      assert parse_args([]) == :help
    end
  end
end
