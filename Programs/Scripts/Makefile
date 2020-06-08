# VARIABLES
JAR_FILE = /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar

# DIRECTORY
INPUT_DIR = input
WORDCOUNT_DIR = wordcount
SORT_DIR = sort
GREP_DIR = grep

# OPTIONS
RESOURCEMANAGER_OPTION = -jt elec-com-eng-p28:8032

# RECIPES 
all:

input: randomtextwriter.xml
	yarn jar $(JAR_FILE) randomtextwriter -conf $(word 1,$^) $(RESOURCEMANAGER_OPTION) $(INPUT_DIR) 1> $@ 2> &1
	hdfs dfs -ls -h $(INPUT_DIR)/part-m-00000
	hdfs dfs -head $(INPUT_DIR)/part-m-00000

wordcount: input
	yarn jar $(JAR_FILE) wordcount $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(WORDCOUNT_DIR) 1> $@ 2> &1

sort: input
	yarn jar $(JAR_FILE) sort $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(SORT_DIR) 1> $@ 2> &1

grep: input
	yarn jar $(JAR_FILE) grep $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(GREP_DIR) "^[a-z0-9_-]{4,8}$$" 1> $@ 2> &1

pi:
	yarn jar $(JAR_FILE) pi $(RESOURCEMANAGER_OPTION) 8 100000 1> $@ 2> &1

clean:
	hdfs dfs -rm -r -f /
.PHONY += input
