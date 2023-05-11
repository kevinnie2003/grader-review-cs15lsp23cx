CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area



git clone $1 student-submission
echo 'Finished cloning'

if [ $? -ne 0 ]; then
    echo 'Failed to clone'
    exit 1
fi

cd grading-area
cp -r ../student-submission/* .
echo 'Finished copying'


set +e
javac -cp $CPATH *.java
if [ $? -ne 0 ]; then
    echo 'Failed to compile'
    exit 1
fi
set -e
echo 'Finished compiling'

cd ..

java -cp $CPATH org.junit.runner.JUnitCore TestRunner > output.txt

if [ $? -ne 0 ]; then
    echo 'Failed to run'
    exit 1
fi

echo 'Finished grading'

# Again output redirection will be useful, and also tools like grep could be helpful here

grep -E 'Tests run: [0-9]+, Failures: [1-9][0-9]*' output.txt



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
