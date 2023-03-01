CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cp -r lib student-submission
cp TestListExamples.java student-submission

cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo "file found"
else 
    echo "need file ListExamples.java"
    exit 1
fi

javac -cp $CPATH *.java 2>compile.txt

if [[ $? -eq 0 ]]
then 
    echo "compile succeesed!!!"
else
    echo "compile failed!!!!"
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > output.txt

cat output.txt

