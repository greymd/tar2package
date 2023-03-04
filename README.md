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

**.tar2package.yml**

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
libdir : null
debarch : <archtecture name i.e amd64>
rpmarch : <archtecture name given by uname -m, i.e x86_64>
```

ATTENTION: `name` must follow this rule.
https://blog.packagecloud.io/eng/2015/07/14/using-dh-make-to-prepare-debian-packages/#understanding-the-package-name-and-version

#### (2). Create tar file

Following files should be placed on the current directory.
`lib` and `man` directories are optional.

```
bin/* -- executable file(s)
lib/* -- library file(s)
man/*.1 -- man file(s)
.tar2package.yml
```

Compression

```
$ tar zcvf myapp.tar.gz -C "$PWD" bin lib man .tar2package.yml
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

## Advanced usage

You can additionally specify following parameters.

#### `libdir`

```
libdir : ...
```

Path of library directory.
Commonly the path is `/usr/lib` but `/usr/lib64/` is used instead in some Linux distros with x86_64 environment.
With this option, library directory is unified to specified path.

#### `debarch`

```
debarch : ...
```

Default value: `noarch`

CPU archtecture name recognized by deb package.
i.e: `arm64`,`armhf`,`i686`,`amd64`
If you are not sure, put `all`.
Please refer to the [manual of debian-policy](https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-architecture) in detail.

#### `rpmarch`

```
rpmarch : ...
```

Default value: `x86_64`

CPU archtecture name recognized by rpm package.
Which is a string as sam as a result given by `uname -m` command.
If you are not sure, execute `uname -m` on the build environment and put the result to the yaml file.
