# Python Package Template

This is my template repository for Python packages.

## Setup

```bash
# Clone the repository
package_name="new-package-name"
git clone https://github.com/brcrista/Python-Package-Template.git $package_name

# Start with clean Git history
cd $package_name
rm -rf .git
git init .

# Replace the placeholder name with the package name
mv package-name $package_name

for file in "Makefile setup.cfg $package_name/__main__.py"
do
    sed -i "s/placeholder-package-name/$package_name/g" Makefile
done

# I like to choose a default branch name
git checkout -b "main"

# Initial commit
git add --all
git commit -m "Initial commit"

# Create and activate a virtual environment
mkdir .venv
source .venv/bin/activate

# Install dependencies
make install-dependencies

# Find TODOs and address them manually
grep "TODO" -R .
```