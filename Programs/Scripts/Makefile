# VARIABLES
JAR_FILE = /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar
INPUT_DIR = input

# OPTIONS
RESOURCEMANAGER_OPTION = -jt elec-com-eng-p28:8032

# RECIPES 
all:

input: randomtextwriter.xml
	hdfs dfs -rm -r -f $(INPUT_DIR)
	yarn jar $(JAR_FILE) randomtextwriter -conf $(word 1,$^) $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)
	hdfs dfs -ls -h $(INPUT_DIR)/part-m-00000
	hdfs dfs -head $(INPUT_DIR)/part-m-00000
.PHONY += input

wordcount:
	yarn jar $(JAR_FILE) wordcount $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000
.PHONY += wordcount

pi:
	yarn jar $(JAR_FILE) pi $(RESOURCEMANAGER_OPTION) 8 100000
.PHONY += pi

clean:
	hdfs dfs -rm -r -f /
.PHONY += input
