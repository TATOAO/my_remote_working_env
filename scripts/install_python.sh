set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh

# install python
mkdir -p $python_source_path
mkdir -p $python_target_dic

cd $python_source_path
tar -xzf Python-$python_version.tgz
cd Python-$python_version

python_target_dic=$(realpath $python_path/python$python_version)
./configure --prefix=$python_target_dic --enable-optimizations
make -j 4
make altinstall
echo "export PATH=$python_path/python$python_version/bin:\$PATH" >> $user_config
cd ../..
source $user_config
