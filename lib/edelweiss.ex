defmodule Edelweiss do
  @doc false
  defmacro __using__(_opts) do
    quote do
      import Edelweiss
    end
  end

  @doc """
  Defines a channel.
  """
  defmacro channel(name, [key: key, val: val]) do
    quote do
      def stuff(), do: IO.puts "Hi!"
    end
  end
end

defmodule Unicast do
  use Edelweiss

  channel :chn, key: {:addr, :id}, val: :val

end