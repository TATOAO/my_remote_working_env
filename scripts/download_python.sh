
# Load environment variables from .env file
set -e
# Navigate to the directory where the script is located
source scripts/load_env.sh

mkdir -p $python_source_path

# download
wget https://www.python.org/ftp/python/$python_version/Python-$python_version.tgz -P $python_source_path
