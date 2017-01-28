function sudope -d "Quickly toggle sudo prefix"
  # If the command line is empty, pull the last command from history.
  if test -z (commandline)
    commandline -r $history[1]
  end

  # buffer the current command line
  set cmdbuf (commandline)
  # buffer cursor position
  set curpos (commandline -C)
  # if the line doesn't already start with "sudo "...
  if not string match -q "sudo *" $cmdbuf
    # add "sudo " to the beginning of the line
    commandline -r "sudo $cmdbuf"
    # place the cursor where it was, +5 chars (since we added 5)
    commandline -C (math $curpos+5)
  else # otherwise, we want to remove it
    # remove "sudo " from the beginning of the line
    commandline -r (string sub --start=6 $cmdbuf)
    # place the cursor where it was, -5 chars (since we removed 5)
    commandline -C (math $curpos-5)
  end
end
