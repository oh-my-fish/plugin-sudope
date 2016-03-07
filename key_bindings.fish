# default key sequence: Ctrl+s
set -q sudope_sequence
  or set -l sudope_sequence \cs

# if sudope is already bound to some sequence, leave it
test (bind | grep -q '[[:space:]]sudope$')
  or set -l do_bind

# not bound but sequence already taken?
if test (bind $sudope_sequence ^/dev/null)
  echo "sudope: The requested sequence is already in use:" (bind $sudope_sequence | cut -d' ' -f2-)
else if set -q do_bind
  bind $sudope_sequence sudope
end
