function deploy_user
    echo "Deploying ~/ from user/"

    set -l source $DOTFILES_DIR/user
    set -l target $HOME

    for file in (find $source -type f)
        set -l relative (string replace "$source/" "" $file)
        set -l destination "$target/$relative"

        mkdir -p (dirname $destination)
        ln -sfn $file $destination
    end

    echo "Done."
end