# Build the binary!
echo "# Brief" > README.md

echo Cleaning existing binary...
rm a.out & \
echo Running Linter... & \
cppcheck --language=c++ --enable=warning,style --template=gcc "thread_demo.cpp" >> README.md & \
echo Building... & \
g++ -std=c++11 -pthread thread_demo.cpp >> README.md
sha256sum thread_demo.cpp > hash.list
sha256sum a.out >> hash.list

# Build the Readme!


echo "A simple multithread application C++ starting point." >> README.md
echo " " >> README.md
echo "# Recent Build Info:" >> README.md
echo "## GCC Version" >> README.md
gcc --version >> README.md
echo "## Linux Test Build Info" >> README.md
uname -a >> README.md
echo "## Build Date" >> README.md
date >> README.md >> README.md
echo "## Build Time" >> README.md
time >> README.md >> README.md
echo "## SHA256 File Hash List" >> README.md
cat hash.list >> README.md
echo "## Git Status" >> README.md
git status >> README.md

# Do Version Control Things!

git add .
git commit
git push
echo Complete.
