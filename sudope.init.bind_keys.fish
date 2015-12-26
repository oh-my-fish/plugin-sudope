function sudope.init.bind_keys --on-event omf_bind_keys
  # default key sequence: Ctrl+s
  set -q sudope_sequence
    or set -l sudope_sequence \cs

  # if sudope is already bound to some sequence, leave it
  test (bind | grep '[[:space:]]sudope$')
      and return 0

  # not bound but sequence already taken?
  if test (bind $sudope_sequence ^ /dev/null)
      echo "sudope: The requested sequence is already in use:" (bind $sudope_sequence | cut -d' ' -f2-)
      return 1
  end

  bind $sudope_sequence sudope
end