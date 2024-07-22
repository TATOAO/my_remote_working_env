# Load environment variables from .env file
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh


export neovim_dic=${neovim_itself_path}
export neovim_path=${neovim_itself_path}/nvim.appimage

echo $neovim_path
if [ -e "$neovim_path" ]; then
  echo "Neovim exists, skip downloading."
else
  echo "Neovim not exists, start downloading."
  mkdir -p $neovim_dic
  curl -o $neovim_path -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x $neovim_path
  echo "alias nvim=$(realpath ${neovim_path})" >> ${user_config}
  echo "Neovim installed $ and alias to 'nvim'"
fi

