# Build the binary!

echo Cleaning existing binary...
rm a.out & \
echo Running Linter... & \
cppcheck --language=c++ --enable=warning,style --template=gcc "thread_demo.cpp" & \
echo Building... & \
g++ -std=c++11 -pthread thread_demo.cpp
sha256sum thread_demo.cpp > hash.list
sha256sum a.out >> hash.list

# Build the Readme!

echo "# Brief" > README.MD
echo "A simple multithread application C++ starting point." >> README.MD
echo " " >> README.MD
echo "# Recent Build Info:" >> README.MD
gcc -v >> README.MD
date >> README.MD
time >> README.MD
echo "## Hash List"
cat hash.list >> README.MD
echo "## Git Status"
git status >> README.MD

# Do Version Control Things!

git add .
git commit
git push
echo Complete.
