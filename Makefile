# MakeFile to update the data and jars files
# Author: Huijie Pan
#1/7/2020
GRAAL_PATH := /mnt/c/Users/Doris/Desktop/GraalVMExample/graalvm-ce-19.2.1/bin
RAPIDWRIGHT_PATH := $(shell pwd)/


.PHONYL: all 

all: install extract remove_jars remove_kryo

install:
	wget https://github.com/Xilinx/RapidWright/releases/download/v2019.2.0-beta/rapidwright_data.zip
	wget https://github.com/Xilinx/RapidWright/releases/download/v2019.2.0-beta/rapidwright_jars.zip

extract: 
	unzip rapidwright_data.zip
	unzip rapidwright_jars.zip

compile:
	CLASSPATH=$(RAPIDWRIGHT_PATH)/bin:$(echo $(RAPIDWRIGHT_PATH)/jars/*.jar | tr ' ' ':')
	PATH="$(GRAAL_PATH):$(PATH)"

run:
	gradle build -p $(RAPIDWRIGHT_PATH)

remove_jars:
	rm ./jars/jython-standalone-2.7.0.jar
	rm ./jars/jupyter-kernel-jsr223.jar
	rm ./jars/jeromq-0.3.6.jar
	rm ./jars/junit-4.12.jar
	rm $(RAPIDWRIGHT_PATH)/bin/com/xilinx/rapidwright/util/RapidWright.class
	rm $(RAPIDWRIGHT_PATH)/src/com/xilinx/rapidwright/util/RapidWright.java

remove_kryo:
	tar zxf kryo_fix.tar.gz


