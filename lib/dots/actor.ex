defmodule Dots.Actor do
  use GenServer
  alias Dots.Dot

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_opts) do
    x = :rand.uniform(800)
    y = :rand.uniform(600)
    hue = :rand.uniform(360)

    dot = %Dot{x: x, y: y, hue: hue, pid: self()}

    pid = GenServer.whereis(Dots.Canvas)
    Process.send(pid, {:new, dot}, [])

    {:ok, dot}
  end
end
