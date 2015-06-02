Edelweiss
=========

This is an implementation of Edelweiss ( http://db.cs.berkeley.edu/papers/vldb14-edelweiss.pdf ), and also Bloom ( http://www.bloom-lang.net/ ), which Edelweiss is based on, in Elixir. I'm doing this partly to learn about Elixir, Edelweiss, and Bloom, and partly to see how far beautiful, correct, distributed programming can go.

Okay, so let me see, we'll definitely need macros for table, scratch, channel, range, and sealed, assuming we keep those from the paper (my current inclination is yes). We'd like to write those along the lines of:

defmodule Unicast do
  use Edelweiss

  channel :chn, key: {:addr, :id}, val: :val
  table :sbuf, key: :id, val: {:addr, :val}
  table :rbuf, sbuf.schema

end
