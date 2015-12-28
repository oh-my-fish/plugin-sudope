function init --on-event init_sudope
  # Here be dragons and code injection,
  # because Fish overrides bindings defined in config.fish,
  # and therefore everything that OMF's init tries to define.

  set -l emit_bind_keys "emit omf_bind_keys"
  set -l fish_key_binding_fn "fish_user_key_bindings"

  if not functions -q $fish_key_binding_fn
    eval "function $fish_key_binding_fn; $emit_bind_keys; end"
  else if not test (functions $fish_key_binding_fn | grep $emit_bind_keys)
    functions $fish_key_binding_fn | sed "\$i \  $emit_bind_keys" | source
  end

  source $OMF_PATH/pkg/sudope/functions/sudope.init.bind_keys.fish
end
