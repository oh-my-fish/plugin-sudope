# default key sequence: Alt+s
set -q sudope_sequence
  or set -l sudope_sequence \es

# if sudope is already bound to some sequence, leave it
if not bind | string match -rq '[[:space:]]sudope$'
  # not bound but sequence already taken?
  if bind $sudope_sequence >/dev/null 2>/dev/null
    echo "sudope: The requested sequence is already in use:" (bind $sudope_sequence | cut -d' ' -f2-)
  else
    bind $sudope_sequence sudope
  end
end
