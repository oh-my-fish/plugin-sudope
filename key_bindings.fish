# default key sequence: Alt+s
set -q sudope_sequence
  or set -l sudope_sequence \es

# if sudope is already bound to some sequence, leave it
if not bind | string match -rq '[[:space:]]sudope$'
  switch $FISH_VERSION
    # in 3.x, fish added a default binding for a more naive version of sudope,
    # and we want to use ours. so we'll use the 3.x+ --user flag to override the preset
    case '3.*'
      # not bound but sequence already taken?
      if bind --user $sudope_sequence >/dev/null 2>/dev/null
        echo "sudope: The requested sequence is already in use:" (bind --user $sudope_sequence | cut -d' ' -f2-)
      else
        bind --user $sudope_sequence sudope
      end
    case '*'
      # not bound but sequence already taken?
      if bind $sudope_sequence >/dev/null 2>/dev/null
        echo "sudope: The requested sequence is already in use:" (bind $sudope_sequence | cut -d' ' -f2-)
      else
        bind $sudope_sequence sudope
    end
  end
end
