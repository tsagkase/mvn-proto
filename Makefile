all: run

LOCAL_MVN_REPO = local-maven-repo
LOGS_DIR = logs
DEPLOY_DIR = target
DEPLOYABLE = $(DEPLOY_DIR)/munism-1.0-jar-with-dependencies.jar

run: ./Makefile $(LOCAL_MVN_REPO) $(LOGS_DIR) $(DEPLOYABLE)
	java -Djava.util.logging.config.file=./config/logging.properties -jar $(DEPLOYABLE)

$(DEPLOYABLE): ./Makefile
	mvn package

$(LOCAL_MVN_REPO): ./Makefile lib/das-kapital-1.1.jar
	-rm -r $(LOCAL_MVN_REPO)
	mkdir $(LOCAL_MVN_REPO)
	mvn deploy:deploy-file -DgroupId=das \
	                       -DartifactId=das.kapital \
			       -Dversion=1.1 \
			       -Durl=file:./$(LOCAL_MVN_REPO)/ \
			       -DrepositoryId=$(LOCAL_MVN_REPO) \
			       -DupdateReleaseInfo=true \
			       -Dfile=lib/das-kapital-1.1.jar 

$(LOGS_DIR): ./Makefile
	-mkdir $(LOGS_DIR)

update-mvn-repo: ./Makefile
	mvn clean install -U

purge-mvn-repo: ./Makefile
	-rm -r $(LOCAL_MVN_REPO)

purge-delivarables: ./Makefile
	-rm -r $(DEPLOY_DIR)

purge-logs: ./Makefile
	-rm -r $(LOGS_DIR)

clean-all: ./Makefile purge-mvn-repo purge-delivarables purge-logs

