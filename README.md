# Run CppMicroServices's ShellService, WebConsole and Tutorial in docker container

## build

```
$ docker build -t cppmicroservices/examples .
```

## ShellService

```
$ docker run -i -t cppmicroservices/examples usShell3 --load=/opt/CppMicroServices/lib/libusShellServiced.so
Installing /opt/CppMicroServices/lib/libusShellServiced.so
us> us-lsReading /tinyscheme/init.scmReading /ShellProcedures.scm
Id  Symbolic Name             Version   State
----------------------------------------------------
0   system_bundle             3.3.0     ACTIVE
1   usShellService            0.1.0     ACTIVE

us> us-ls
Id  Symbolic Name             Version   State
----------------------------------------------------
0   system_bundle             3.3.0     ACTIVE
1   usShellService            0.1.0     ACTIVE

us> us-install "/src/CppMicroServices/lib/libeventlistener.so"

us> us-ls
Id  Symbolic Name             Version   State
----------------------------------------------------
0   system_bundle             3.3.0     ACTIVE
1   usShellService            0.1.0     ACTIVE
2   eventlistener             0.0.0     INSTALLED

us> us-bundle-start "eventlistener"
Starting to listen for service events.

us> us-ls
Id  Symbolic Name             Version   State
----------------------------------------------------
0   system_bundle             3.3.0     ACTIVE
1   usShellService            0.1.0     ACTIVE
2   eventlistener             0.0.0     ACTIVE

us> us-bundle-stop "eventlistener"
Stopped listening for service events.

us> us-ls
Id  Symbolic Name             Version   State
----------------------------------------------------
0   system_bundle             3.3.0     ACTIVE
1   usShellService            0.1.0     ACTIVE
2   eventlistener             0.0.0     RESOLVED

us>
```

## WebConsole

```
$ docker run -p 8080:8080 -t cppmicroservices/examples /src/CppMicroServices/bin/usWebConsoleDriver /opt/CppMicroServices/lib/libusWebConsoled.so
```

go to `http://localhost:8080/us/console` to access the console.

##

## run

```
$ docker run -i -t cppmicroservices/examples /src/CppMicroServices/bin/usTutorialDriver
> h
h                    This help text
start <id | name>    Start the bundle with id <id> or name <name>
stop <id | name>     Stop the bundle with id <id> or name <name>
status               Print status information
shutdown             Shut down the framework
> status
Id | Symbolic Name        | State
-----------------------------------
 0 | system_bundle        | ACTIVE
 1 | eventlistener        | INSTALLED
 2 | dictionaryservice    | INSTALLED
 3 | frenchdictionary     | INSTALLED
 4 | dictionaryclient     | INSTALLED
 5 | dictionaryclient2    | INSTALLED
 6 | dictionaryclient3    | INSTALLED
 7 | spellcheckservice    | INSTALLED
 8 | spellcheckclient     | INSTALLED
>
> start eventlistener
Starting to listen for service events.
> status
Id | Symbolic Name        | State
-----------------------------------
 0 | system_bundle        | ACTIVE
 1 | eventlistener        | ACTIVE
 2 | dictionaryservice    | INSTALLED
 3 | frenchdictionary     | INSTALLED
 4 | dictionaryclient     | INSTALLED
 5 | dictionaryclient2    | INSTALLED
 6 | dictionaryclient3    | INSTALLED
 7 | spellcheckservice    | INSTALLED
 8 | spellcheckclient     | INSTALLED
> shutdown
Stopped listening for service events.
$
```
