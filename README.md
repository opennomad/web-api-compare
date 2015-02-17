A simple REST web API in different languages.

the `test.sh` does a few simpler curl calls and returns the results. There should be 200, 200, 400, 200 along with the actual output.

To run the siege test simply call

```shell
sudo siege -b -t 20s -c 100 -T 'application/json' "http://localhost:8080/sort POST <test.json"
```

The `sudo` seems to be needed for more than 15 connections, but can be left off otherwise.

# setting up the environment on Ubuntu 14.04

## go

```shell
sudo apt-get install golang
```

## nodejs

```shell
sudo apt-get install nodejs npm
npm install express
npm install body-parser
```

## ruby

```shell
sudo apt-get install ruby
sudo apt-get install ruby1.9.1-dev
gem install --user sinatra
gem install --user thin
```

## python

```shell
sudo apt-get install python-flask
```

## perl

```shell
sudo apt-get install libmojolicious-perl libdatetime-perl
```

## all

```shell
    sudo apt-get install ruby nodejs golang npm
```
