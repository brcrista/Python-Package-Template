# Python Package Template

This is my template repository for Python packages.

## Setup

```bash
# Clone the repository
package_name="new_package_name"
git clone https://github.com/brcrista/Python-Package-Template.git $package_name

# Start with clean Git history
cd $package_name
rm -rf .git
git init .

# Replace the placeholder name with the package name
placeholder_name="placeholder_package_name"
mv $placeholder_name $package_name
mv $package_name/$placeholder_name.py $package_name/$package_name.py
mv tests/test_$placeholder_name.py tests/test_$package_name.py

for file in "Makefile setup.cfg $package_name/__main__.py"
do
    sed -i "s/placeholder_package_name/$package_name/g" $file
done

# I like to choose a default branch name
git checkout -b "main"

# Initial commit
git add --all
git commit -m "Initial commit"

# Create and activate a virtual environment
python -m venv .venv
source .venv/bin/activate

# Install dependencies
make install-dependencies

# Find TODOs and address them manually
git grep "TODO"
```
