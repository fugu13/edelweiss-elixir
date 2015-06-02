defmodule Edelweiss do
  @doc false
  defmacro __using__(_opts) do
    quote do
      import Edelweiss

      @collections []
    end
  end

  defp collection(name, [key: key, val: val]) do
    if is_atom(key), do: key = {key}
    if is_atom(val), do: val = {val}
    quote do
      @collections [{unquote(name), %Bloom.Collection{schema: [key: unquote(Macro.escape(key)), val: unquote(Macro.escape(val))]}}|@collections]
      def unquote(Atom.to_string(name))(), do: @collections[unquote(name)]
    end
  end

  defp collection(name, [schema: name]) do
    collection(name, @collections[name].schema)
  end


  @doc """
  Defines a channel.
  """
  defmacro channel(name, schema) do
    collection(name, schema)
  end

  @doc """
  Defines a table.
  """
  defmacro table(name, schema) do
    collection(name, schema)
  end
end

defmodule Unicast do
  use Edelweiss

  channel :chn, key: {:addr, :id}, val: :val
  table :sbuf, key: :id, val: {:addr, :val}
  table :rbuf, schema: :sbuf
  

  def stuff() do
    IO.inspect(@collections[:sbuf])
  end

end