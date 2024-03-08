# Windows Command improvement

Try to answer lots of questions.


## Code Page

With command you have not always UTF8 encoding.\
It's something else depending of your system configuration (local).

This sucks because you can not have special characters like é ç à è ... in your command files (.cmd).

What is your CP?\
In Command type :

``` cmd
chcp
```

In my computer the answer is 850. This is not UTF8.

To have UTF8 I have to type :

``` cmd
CHCP 65001
```

Now I'm in UTF8 but it's not permanent.


## AutoRun with Command ?

It's possible if you play with the registry of Windows.\
I do not recommand that, avoid it.\
And if your not admin, you can not do it.\
So Forgot this way.

## Use shortcut

This is the best way. No need to be admin.\
Just create a shortcut.\
With target :

``` cmd
%comspec% /k
``` 

Double clic your shorcut and it lauch the Windows Command.\
Tune it as you wish, colors, etc.\
Close.\
Right clic on your shorcut, Parameters, tune evrything.\
You have a parameter like "start in".\
Change it to have :

``` cmd
%HOMEDRIVE%%HOMEPATH%
```

## Want a profile

The easy way is to have a directory in your path.\
You can do that even if you are not admin of the computer.\
This directory is where you put all your cmd files.\
Inside, put all the .cmd files.

### The AutoRun.cmd

In the Shortcut, change the target to be :

``` cmd
%comspec% /k AutoRun.cmd
``` 

Now each time you lauch Command with your shortcup, evrything in the AutoRun.cmd apply.

So far so good, do what you want.

You can have a shortcut for each feature you need.

Python, Git, Node.js, etc.

___