### Installing Neovim config
Install vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
Then :PlugInstall within neovim to install the plugins.

Install plugin dependencies
```
sudo pacman -S ctags npm python-pip
```
If you get `ImportError: cannot import name 'PythonVersion' from 'pip._vendor.packaging.tags'` you might need to fix pip with:
```
curl -sS https://bootstrap.pypa.io/get-pip.py | sudo python3
type pip3
hash -r
pip3
```

Install steps for coc.nvim
```
pip3 install jedi
cd ~/.local/share/nvim/plugged/coc.nvim
sudo npm install -g yarn
yarn install
yarn build
```

Now within Neovim, you should be able to install modules for your languages with :CocInstall coc-python for example.
