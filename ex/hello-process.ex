current_process = self()

# Spawn an Elixir process (not an operating system one!)
spawn_link(fn ->
  send(current_process, {:msg, "Hello from Elixir!"})
end)

# Block until the message is received
receive do
  {:msg, contents} -> IO.puts(contents)
end
