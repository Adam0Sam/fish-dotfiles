function on_directory_change --on-variable PWD
    # TODO: Make load_nvmrc a valid fish function
    
end    

if status is-interactive
    # Commands to run in interactive sessions can go here
    set -U fish_greeting
    # on_directory_change
end

