# tar2package

Create packages for Linux distros with extremely simple way.
This software is supposed to be used to distribute the small CLI application which has only one executable file.
If the application includes multiple libraries, executable commands, you should use another way.

## Installation

This software is distributed as docker container.
Pull following docker containers.

```
$ docker pull greymd/tar2rpm
$ docker pull greymd/tar2deb
```

## Getting Started

#### (1). Prepare yaml file

**template.yml**

```
name : <application name>
cmdname : <command name>
summary : <summary of the application>
description : <description of the application>
version : <version of the application>
changelog : <changes from previous version>
url : <url of the application>
author : <author name>
email : <email>
```

#### (2). Create tar file

Following files should be placed on the current directory.

```
bin/* -- executable file(s)
man/*.1 -- man file(s)
template.yml
```

Compression

```
$ tar zcvf myapp.tar.gz -C "$PWD" bin man template.yml
```

#### (3). Convert it to package files (deb/rpm)

```
$ cat myapp.tar.gz | docker run -i greymd/tar2rpm > myapp.rpm
```

```
$ cat myapp.tar.gz | docker run -i greymd/tar2deb > myapp.deb
```

#### (4). Installation !


* With `yum`

```
$ yum install ./myapp.rpm
```

* With `dpkg`

```
$ dpkg -i ./myapp.deb
```

That's it.
