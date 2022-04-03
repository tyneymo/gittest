#!/bin/bash
LOCAL_DIRECTORY=~/.jvm2
SOURCE_USER=/home/xxx
TARGET_JVM=11
URL=https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz
SOURCE_JAVA_FILE=${URL##*/}


if [ ! -d "$LOCAL_DIRECTORY" ]; then
	echo "creating director ~/.jvm"
	mkdir $LOCAL_DIRECTORY
	echo "downloading java version $TARGET_JVM"
	wget  $URL
    mv $SOURCE_JAVA_FILE $LOCAL_DIRECTORY
	echo "extracting $SOURCE_JAVA_FILE..."
	tar -xzf $LOCAL_DIRECTORY/$SOURCE_JAVA_FILE -C $LOCAL_DIRECTORY/
	echo "created java environment files"
fi

JAVA_HOME_DIR=$(find $LOCAL_DIRECTORY -maxdepth 1 -type d | grep $TARGET_JVM)

export JAVA_HOME=$JAVA_HOME_DIR
export PATH="$JAVA_HOME/bin:$PATH"

if [ ! -f "~/bin/xdm.jar" ]; then 
	cp $SOURCE_USER/bin/xdm.jar .
	echo "Copied xdm.jar from source user" 
	java -jar xdm.jar 
	rm xdm.jar
else 
	echo "found xdm.jar in local bin" 
	java -jar ~/bin/xdm.jar
fi



