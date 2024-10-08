function yarnpublic
    yarn config set -H npmRegistryServer https://registry.npmjs.org
end

function yarnprivate
    yarn config set -H npmRegistryServer https://npm.dev.wixpress.com
end

function npmpublic
    npm config set registry https://registry.npmjs.org/ && npm config get registry
end

function npmprivate
    npm config set registry https://npm.dev.wixpress.com && npm config get registry
end

function nodesync 
    nvm use
    corepack enable
end

function vdown
    set ORIGINAL_DIR (pwd)
    cd /Users/adamsam/repos/digital-voting-platform/apps/api
    docker compose down
    cd $ORIGINAL_DIR
end

function vup
    set ORIGINAL_DIR (pwd)
    cd /Users/adamsam/repos/digital-voting-platform/apps/api
    docker compose up -d db
    cd $ORIGINAL_DIR
end

function pblog 
    set ORIGINAL_DIR (pwd)
    cd ~/repos/wix-blog/blog-client
    nodesync
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
    echo "Obsync Done."
    cd $ORIGINAL_DIR
end

function adb
    /Users/adamsam/Library/Android/sdk/platform-tools/adb $argv
end

function vpy
    if test -d .venv
        ./.venv/bin/python $argv
    else if test -d venv
        ./venv/bin/python $argv
    else
        echo "Neither .venv nor venv directory exists."
    end
end
