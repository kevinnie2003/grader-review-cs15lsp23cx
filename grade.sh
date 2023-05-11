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

cp -r student-submission/src/* grading-area


cd grading-area
set +e
javac -cp $CPATH *.java
if [ $? -ne 0 ]; then
    echo 'Failed to compile'
    exit 1
fi
set -e

java -cp $CPATH org.junit.runner.JUnitCore TestRunner > test-output.txt
if [ $? -ne 0 ]; then
    echo 'Failed to run tests'
    exit 1
fi


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
