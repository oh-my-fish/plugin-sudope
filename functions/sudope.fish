function sudope -d "Quickly toggle super user command prefix"

  # Save the current command line and cursor position.
  set -l command_buffer (commandline)
  set -l cursor_position (commandline -C)

  # If no custom super user command defaults to sudo
  if test -z "$su_command"
    set su_command 'sudo'
  end

  # Save su command length
  set -l su_command_length (string length -- "$su_command")

  # If the command line is empty, pull the last command from history.
  if test -z "$command_buffer"
    set command_buffer $history[1]
  end

  # Parse the command line (first line only).
  set -l command_parts (string match -ir "^(\s*)($su_command(\s+|\$))?(.*)" $command_buffer[1])

  # Handle multiline commands with extra care.
  set -l command_lines_count (count $command_buffer)
  test $command_lines_count -gt 1
    and set -l command_rest $command_buffer[2..$command_lines_count]

  switch (count $command_parts)
    case 3
      # No su command.

      # Add the su command to the beginning of the command, after any leading whitespace (if present).
      commandline -r (string join \n (string join '' $command_parts[2] "$su_command " $command_parts[3]) $command_rest)

      # Push the cursor position ahead if necessary
      test $cursor_position -ge (string length -- "$command_parts[2]")
        and set cursor_position (math $cursor_position+$su_command_length)

      # Place the cursor where it was (or where it should be).
      commandline -C $cursor_position

    case 5
      # The su comamnd is present in the beginning of the command.

      # Remove the su command, leave any leading whitespace (if present).
      commandline -r (string join \n (string join '' $command_parts[2 5]) $command_rest)

      # Push the cursor position back if appropriate (su command and whitespace).
      set -l lead_length (string length -- "$command_parts[2]")
      set su_command_length (string length -- "$command_parts[3]")
      if test $cursor_position -ge (math $lead_length+$su_command_length)
        # The cursor was after the su command.
        set cursor_position (math $cursor_position-$su_command_length)
      else if test $cursor_position -ge $lead_length
        # The cursor was somewhere on the su command.
        set cursor_position $lead_length
      end

      # Place the cursor where it was (or where it should be).
      commandline -C -- $cursor_position
  end
end
