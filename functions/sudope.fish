function sudope -d "Quickly toggle sudo prefix"
  # If the command line is empty, pull the last command from history.
  if test -z (commandline)
    commandline -r $history[1]
  end
  # Read the current command line, tokenize it, store it in $cmd_buffer.
  commandline | read -la cmd_buffer
  # Either put "sudo" or remove it from the beginning of the line.
  if not contains "sudo" $cmd_buffer
    commandline -r "sudo $cmd_buffer"
  else
    commandline -r (echo "$cmd_buffer" | sed -E s/"^sudo\s+(.*)"/"\1"/)
  end
end