echo Cleaning existing binary...
rm a.out & \
echo Running Linter... & \
cppcheck --language=c++ --enable=warning,style --template=gcc "thread_demo.cpp" & \
echo Building... & \
g++ -std=c++11 -pthread thread_demo.cpp
sha256sum thread_demo.cpp > hash.list
sha256sum a.out >> hash.list

echo " " >> README.MD
echo recent build info: >> README.MD
gcc -v >> README.MD
date >> README.MD
time >> README.MD
cat hash.list >> README.MD
git status >> README.MD
git add .
git commit
git push
echo Complete.
