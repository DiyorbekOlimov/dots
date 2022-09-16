REPOSITORY_URL="https://github.com/DiyorbekOlimov/dotfiles"

FOLDER_NAME="diyorbeks-dotfiles"
CACHE_DIRECTORY="~/.cache/"
TEMP_PATH="$CACHE_DIRECTORY$FOLDER_NAME"

function aur_install() {
    if command -v paru &> /dev/null; then
        paru -S $1
    elif command -v yay &> /dev/null; then
        yay -S $1
    else
        echo "Failed to install dependencies"
        echo "You can install dependencies on your own later"
    fi
}

files=(
    ".zshrc"
)


if [ ! -d "~/.cache/" ]; then
    mkdir ~/.cache/
fi

if [ -d $TEMP_PATH ]; then
    rm -rf $TEMP_PATH
fi

git clone $REPOSITORY_URL $TEMP_PATH


echo "Installing dependencies"

if command -v yay &> /dev/null
then
    
elif command -v paru &> /dev/null
then
    echo "paru exists"
fi

aur_install $(cat $TEMP_PATH/deps)


for i in `ls "$TEMP_PATH/.config"`; do
    echo "Copying $i"
    if [ -d $HOME/.config/$i ]; then
        echo "- Backing up old ~/.config/$i"
        mv ~/.config/$i{,.bak}
    fi
    cp $TEMP_PATH/.config/$i $HOME/.config/
done

for i in "${files[@]}"; do
    echo "Copying $i"
    if [ -f $HOME/$i ]; then
        echo "- Backing up old ~/$i"
        mv ~/$i{,.bak}
    fi
    cp $TEMP_PATH/$i $HOME/
done


echo "\n\nDone!"
