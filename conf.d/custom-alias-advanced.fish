function pblog 
    set ORIGINAL_DIR (pwd)
    cd ~/repos/wix-blog/blog-client
    nvm use
    corepack enable
    npmprivate
    yarnprivate
    yarn
    cd packages/communities-blog-client-common
    yarn build
    cd $ORIGINAL_DIR
end

function obsync
    set ORIGINAL_DIR (pwd)
    set folder_name '.obsidian'
    cd ~/Documents/Obsidian
    echo "Finding the latest directory with the folder $folder_name ..."
    set latest_dir (get_latest_folder $folder_name)
    echo "Latest directory: '$latest_dir'"
    echo "Copying $latest_dir$folder_name to all sister dirs ..."
    copy_to_all_dirs $latest_dir $folder_name
    echo "Done."
    cd $ORIGINAL_DIR
end