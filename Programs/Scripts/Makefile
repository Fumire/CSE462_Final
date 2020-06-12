# VARIABLES
JAR_FILE = /opt/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.2.1.jar

# DIRECTORY
INPUT_DIR = input
WORDCOUNT_DIR = wordcount
SORT_DIR = sort
GREP_DIR = grep
WORDMEAN_DIR = wordmean
WORDMEDIAN_DIR = wordmedian
WORDSTD_DIR = wordstandarddeviation

# OPTIONS
RESOURCEMANAGER_OPTION = -jt elec-com-eng-p28:8032

# RECIPES 
all:

input: randomtextwriter.xml
	yarn jar $(JAR_FILE) randomtextwriter -conf $(word 1,$^) $(RESOURCEMANAGER_OPTION) $(INPUT_DIR) 2>&1 | tee $@

wordcount: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) wordcount $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(WORDCOUNT_DIR)$$i 2>&1 | tee -a $@; done;

sort: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) sort $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(SORT_DIR)$$i 2>&1 | tee -a $@; done;

grep: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) grep $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(GREP_DIR)$$i "^[a-z0-9_-]{4,8}$$" 2>&1 | tee -a $@; done;

wordmean: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) wordmean $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(WORDMEAN_DIR)$$i 2>&1 | tee -a $@; done;

wordmedian: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) wordmedian $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(WORDMEDIAN_DIR)$$i 2>&1 | tee -a $@; done;

wordstd: input
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) wordstandarddeviation $(RESOURCEMANAGER_OPTION) $(INPUT_DIR)/part-m-00000 $(WORDSTD_DIR)$$i 2>&1 | tee -a $@; done;

pi:
	for i in `seq 10`; do date >> $@; yarn jar $(JAR_FILE) pi $(RESOURCEMANAGER_OPTION) 8 100000 2>&1 | tee -a $@; done;

clean:
	hdfs dfs -rm -r -f /user/root
	rm -fv input wordcount sort grep pi
.PHONY += input

history.csv: wordcount sort grep wordmean wordmedian wordstd
	sadf -dhH -P ALL -- -A > $@
	sed --in-place "s/;/,/g" $@
