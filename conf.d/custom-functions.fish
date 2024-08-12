function scr
    set arg $argv
    if test (string sub -s 1 -l 1 $arg) != "."
        set arg ".$arg"
    end
    cat package.json | jq $arg
end

function killport
    lsof -i :$argv | awk 'NR==2 {system("kill -9 " $2)}'
end

function find_latest_folder --argument folder_name
    if not test -n "$folder_name"
        echo "Please provide a folder name as an argument."
        return 1
    end

    set latest_time 0
    set latest_folder ""

    for dir in */ 
        set target_dir "$dir/$folder_name"
        
        if test -d $target_dir
            set mod_time (stat -f "%m" $target_dir)

            if test "$mod_time" -gt "$latest_time"
                set latest_time $mod_time
                set latest_folder $dir
            end
        end
    end

    # Output the result
    if test -n "$latest_folder"
        echo $latest_folder
        return 0
    else
        echo "No '$folder_name' folder found in the current directory."
        return 1
    end
end

function test1
    for dir in */
        echo $dir
    end
end


function copy_to_all_dirs --argument target_dir target_folder
    if not test -d "$target_dir"
        echo "Error: The latest directory '$target_dir' does not exist."
        return 1
    end

    if not test -d "$target_dir/$target_folder"
        echo "Error: The target folder '$target_folder' does not exist in $target_dir."
        return 1
    end

    for dir in */ 
        echo "Checking $dir ..."
        if test "$dir" = "$target_dir"
            echo "Skipping $dir ..."
            continue
        end

        if not test -d "$dir/$target_folder"
            echo "Error: The folder $target_folder does not exist in $dir."
            return 1
        end

        echo "Copying $target_folder from $target_dir to $dir ..."
        
        cp -r "$target_dir/$target_folder"* "$dir/$target_folder"

        end
    echo "Done."
    return 0   
end


function latest_sync --argument folder_name
    set latest_dir (find_latest_folder $folder_name)
    copy_to_all_dirs $latest_dir $folder_name
    return 0
end