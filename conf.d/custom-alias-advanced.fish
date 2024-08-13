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
    cd ~/Documents/Obsidian
    latest_sync .obsidian
    cd $ORIGINAL_DIR
end