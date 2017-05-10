#!/usr/bin/env bash

DOTFILES=$(pwd -P)

info () {
    printf "\033[00;34m$@\033[0m\n"
}

doUpdate() {
    info "Updating"
    git pull origin master;
}

doSync() {
    info "Syncing"
    rsync --exclude ".git/" \
        --exclude "installers/" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        --exclude ".gitignore" \
        --filter=':- .gitignore' \
        -avh --no-perms . ~;

    # The .gitconfig was overwritten so reconfigure it.
    git config --global core.excludesfile ~/.gitignore_global
}

doInstall() {
    info "Installing Extras"
    
    # FZF
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

doAll() {
    doUpdate
    doSync
    doInstall
}

doHelp() {
    echo "Usage: $(basename "$0") [options]" >&2
    echo
    echo "   -s, --sync             Synchronizes dotfiles to home directory"
    echo "   -i, --install          Install (extra) software"
    echo "   -a, --all              Does all of the above"
    echo
    exit 1
}
if [ $# -eq 0 ]; then
    doHelp
else
    for i in "$@"
    do
        case $i in
            -s|--sync)
                doSync
                shift
                ;;
            -i|--install)
                doInstall
                shift
                ;;
            -a|--all)
                doAll
                shift
                ;;
            *)
                doHelp
                shift
                ;;
        esac
    done
fi