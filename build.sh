echo Cleaning existing binary...
rm a.out & \
echo Running Linter... & \
cppcheck --language=c++ --enable=warning,style --template=gcc "thread_demo.cpp" & \
echo Building... & \
g++ -std=c++11 -pthread thread_demo.cpp
sha256sum thread_demo.cpp > hash.list
sha256sum a.out >> hash.list

echo " " >> readme.md 
echo recent build info: >> readme.md
gcc -v >> readme.md
date >> readme.md
time >> readme.md
cat hash.list >> readme.md
git status >> readme.md
git add .
git commit
git push
echo Complete.
