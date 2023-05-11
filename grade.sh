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
cp -r ../TestListExamples.java .
cp -r ../lib .
echo 'Finished copying'

set +e
javac -cp $CPATH *.java
if [ $? -ne 0 ]; then
    echo 'Failed to compile'
    exit 1
fi

echo 'Finished compiling'

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt
echo 'Finished grading'
tail -n 3 output.txt