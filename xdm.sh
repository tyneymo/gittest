#!/bin/bash
LOCAL_DIRECTORY=~/.jvm

if [ ! -d "$LOCAL_DIRECTORY" ]; then
	mkdir $LOCAL_DIRECTORY
	SOURCE_JAVA_FILE=$(ls /home/xxx/.jvm | grep tar.gz)
	cp /home/xxx/.jvm/$SOURCE_JAVA_FILE $LOCAL_DIRECTORY/
	tar -xzf $LOCAL_DIRECTORY/$SOURCE_JAVA_FILE -C $LOCAL_DIRECTORY/
	echo "copied java environment files"
fi

JAVA_HOME_DIR=$(find $LOCAL_DIRECTORY -maxdepth 1 -type d | grep 11)

export JAVA_HOME=$JAVA_HOME_DIR
export PATH="$JAVA_HOME/bin:$PATH"

if [ ! -f "~/bin/xdm.jar" ]; then 
	cp /home/xxx/bin/xdm.jar .
	echo "Copied xdm.jar"
else 
	cp ~/bin/xdm.jar .
fi

java -jar xdm.jar 

rm xdm.jar
