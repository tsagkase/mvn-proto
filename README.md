# Maven prototype project with jar in local mvn repo

The local `jar` lives in the

    lib

directory. It gets *uploaded* to the local Maven repo and from then on
can be used in your `pom.xml` files after you instruct them to consult
the local mvn repo with the following:

```xml
    <repositories>
        <repository>
            <id>local-maven-repo</id>
            <url>file:///${project.basedir}/local-maven-repo</url>
        </repository>
    </repositories>
```

Kudos to [this](https://stackoverflow.com/a/36602256).


# Installation

You will need the Java 8 SDK or higher installed on your system to
compile and run the code as well as [Maven](https://maven.apache.org/).

You can ignore everything below if you invoke

    make

which will make the default target `run`.

To start from clean run

    make clean-all


# Compiling ...

All you should need to do is invoke `mvn package` and Maven will prepare under
`./target` directory a fat JAR for you containing all the dependencies. 


# Running

Prior to running, make sure you have a top level `logs` directory if you plan to
use the default logging properties file supplied under `config`.

Under `./target` directory you can find two JAR files, a thin one and a fat one
(the one that has `-jar-with-dependencies` as part of its name) By invoking

    java -Djava.util.logging.config.file=./config/logging.properties -jar target/munism-1.0-jar-with-dependencies.jar

the application will run.


# Status

The project should run out of the box on both Windows and Linux machines!
No logging is actually done.


# Issues

   1. No explicit IntelliJ/Eclipse support
   1. No logging? *(Old logging versions)*


