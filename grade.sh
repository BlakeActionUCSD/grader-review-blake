CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

#git clone git@github.com:testFolder
if [[ -f student-submission/ListExamples.java ]]
then
    echo "Found files!"
else
    echo "Files not found."
    echo "Your score is 0/100."
    exit 1
fi

mv student-submission/* .

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
if [[ $? == 0 ]]
then
    echo "Compiled successfully!"
else
    echo "Failed to compile."
    echo "Your score is 0/100."
    exit 1
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples
if [[ $? == 0 ]]
then
    echo "Ran successfully!"
    echo "Your score is 100/100. Sending diploma..."
else
    echo "Runtime error."
    echo "Your score is 0/100."
    exit 1
fi
