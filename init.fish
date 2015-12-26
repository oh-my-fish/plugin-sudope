function init --on-event init_sudope
  # Here be dragons and code injection,
  # because Fish overrides bindings defined in config.fish,
  # and therefore everything that OMF's init tries to define.

  if not test (functions fish_user_key_bindings | grep "emit omf_bind_keys")
    funced fish_user_key_bindings -e "sed -i'' '/^end\$/i \
      emit omf_bind_keys'"
  end

  source $OMF_PATH/pkg/sudope/sudope.init.bind_keys.fish
end
