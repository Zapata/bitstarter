startup-coursera
================

Coursera Startup Course Project

Install
-------
1. Start an Amazon Web Service EC2 t1.micro instance.
2. Connect in ssh.
3. Install everything:
```sh
wget https://raw.github.com/Zapata/startup-coursera/master/install.sh
./install.sh # Do not pipe as it requires interactive session.
```
4. Close terminal and reconnect.

At this point you should have:
 - A configured shell, screen, emacs.
 - All server side javascript stuff installed (node, npm, jshint, ...)
 - startup-coursera repository downloaded and properly setup to work with github and heroku.
