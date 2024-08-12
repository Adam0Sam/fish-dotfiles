function load_nvmrc
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  echo "nvmrc_path: $nvmrc_path"

  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    echo "nvmrc_node_version: $nvmrc_node_version"

    if test "$nvmrc_node_version" = "N/A"
      nvm install
      echo "Installed node version from .nvmrc"
    else if test "$nvmrc_node_version" != "$node_version"
      nvm use
        echo "Switched to node version from .nvmrc"
    end
  else if test "$node_version" != (nvm version default)
    echo "Reverting to nvm default version"
    nvm use default
  end
end