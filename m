From: Shriramana Sharma <samjnaa@gmail.com>
Subject: Multiple declaration problem
Date: Sat, 24 Feb 2007 21:19:23 +0530
Message-ID: <45E05E83.5010005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020300010204040807070906"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.
--------------020300010204040807070906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello. I have a problem with multiple declaration in a project I am 
working on. I have constructed a similar testcase which throws the same 
kind of error. Please see the files in the attachment. -g or -g3 did not 
give any useful debugging symbols, I don't know why. The following is 
the session transcript:

$ ls
main.cpp  myheader.cpp  myheader.h
$ g++ -c main.cpp
$ g++ -c myheader.cpp
$ g++ -o main main.o myheader.o
myheader.o:(.data+0x0): multiple definition of `b'
main.o:(.data+0x0): first defined here
collect2: ld returned 1 exit status
$ mv main.cpp main.c
$ mv myheader.cpp myheader.c
$ rm *.o
$ gcc -c main.c
$ gcc -c myheader.c
$ gcc -o main main.o myheader.o
myheader.o:(.rodata+0x0): multiple definition of `a'
main.o:(.rodata+0x0): first defined here
myheader.o:(.data+0x0): multiple definition of `b'
main.o:(.data+0x0): first defined here
collect2: ld returned 1 exit status

In my project, I need to put the following statement in a header file:

int lawCurrentEngine = NONE ; // NONE has been enum-med previously

because I need to declare a function

int lawCloseEngine ( int engineID = lawCurrentEngine ) ;

I include the header file containing these two lines in two cpp files, 
and I get a multiple definition error for lawCurrentEngine just like in 
the given test case. If I push the lawCurrentEngine declaration to one 
of the cpp-s (it's not needed in the other cpp) I am unable to provide 
the default argument for the lawCloseEngine which can be done only in 
the header.

I don't understand how I am getting such an error when I have used the 
#ifndef #define #endif technique as per good programming practice.

Please help,

Thanks.

Shriramana Sharma.

--------------020300010204040807070906
Content-Type: application/gzip;
 name="multiple-declaration-problem.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="multiple-declaration-problem.tar.gz"

H4sICLdb4EUAAzlHdHF6Yi50YXIA7Zdda9swFIZ9O/+KQ9qxZm0a+SuGjF0MVuhNb3Y3KGyK
LS8atmVkubSM/fdJdh1rY/mAhISt57mIj47kSEdHryQXTa54lbNJypKcSqq4KCeVFIucFVPn
MBBNHEXm6cURsZ89jkeimJAoms08h3izMIwciA7U/0aaWlEJ4NS0+F5Surbdtvp/lGJT/oun
JaMpk9dJVe3Rh0mwzuja/Psk6PMfhrHOv0/ikDhADhblBl54/s+Al0nepAxGq2wvR65r+WuV
ctE6HwRPoXiqJC8VXID5TWDs/nBfta5M+0b35X1JgdfwOr2CRW8knWEqR1dAdY3xjeGd+9M9
9RS8aDbrn/JyT+0btumfxPGg/1lk9O8RH/V/DNbp32jbpF9LulV9q/JB+gFq9/9gt/N/uVcf
2/Tvxav7XxgExOg/RP0fB63/rExZBnefb28+fLz59OVWn/3awUtm+9xElLVqj3wK78HX6jf2
QtuBttdcDUzNGbAy5RlMp/b/nTpupGOj/pmUQk5Eo6pG7dHHFv17nuevvv+iOND616UQ9X8M
ziGv3f6eB2B/8VmlpXsO3y4vYZJA39byWO/0XtFdHtrGYmgh3MGcX1ynVNFL8kjGc+jXYbf1
cLMMQWTwdfGmG90fzTMu9W7UbVMpLJlkeoPKc5Yofw55CpKpRpoqD9gjV6CTrJpaj654WEXw
bDw77cCHgq6UBbzVA9eBJckwAVbZbtz6dgteih3Cp1b4v73wlwk48dSeeiUjCIIgCIIgCIIg
CIIgCIIgNr8Aa9PAjwAoAAA=
--------------020300010204040807070906--


