From: Shriramana Sharma <samjnaa@gmail.com>
Subject: can't understand linking behaviour
Date: Sun, 27 May 2007 20:20:31 +0530
Message-ID: <46599AB7.1010701@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040400090603090202080303"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: Linux C Programming List <linux-c-programming@vger.kernel.org>

This is a multi-part message in MIME format.
--------------040400090603090202080303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Consider:

main.c calls function firstcall()
a.c defines function firstcall() which calls secondcall()
b.c defines function secondcall()

To build the executable main, I need to do:

gcc -fPIC -c a.c
gcc -fPIC -shared -o liba.so a.o
gcc -fPIC -c b.c
gcc -fPIC -shared -o libb.so b.o
gcc -o main main.c -L. -la -lb

My question is, why does not the creation of liba.so require the 
presence of and linking against libb.so, seeing as a.o contains 
firstcall() which calls secondcall() present only in libb.so?

The gcc command building liba.so does not use -c which would prevent the 
linker from being called. So if the linker is called then it should 
require the presence of and linking to libb.so to resolve the reference 
to the external function secondcall(). But this does not happen.

What does happen is that I am supposed to specify at the point of 
building the *executable* not only the libraries that the executable 
depends on, but also the libraries that *those* libraries depend on, as 
well as, presumably, any third-level, fourth-level and upto n-th level 
dependencies.

This seems highly counter-intuitive. Why would the linker require *only* 
at *executable* build-time the libraries, and the whole dependency 
*tree* at that, to be specified? Why does it not need at each level of 
build of an executable or library its and only its own dependencies?

Thanks as always, in advance,

Shriramana Sharma.

--------------040400090603090202080303
Content-Type: application/gzip;
 name="shlib-test.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="shlib-test.tar.gz"

H4sICNuPWUYAAzdwV0ZjYy50YXIA7ZdBT4MwFIC5yq94bhc9wNoy4KDx4snEgz/ASylMalgx
lBkT43+3dY6V6CQmsmXxfQmBtO+lkNePtrqsZBa0hW5n3lgQQxrH9k7TmLj3DR4lCUsikqY0
9QhlaRx5EI/2Rg4r3fIGwNN8+ag43xk31H+k6G39eSjGGcMWOJnPd9afsq7+CWPM1D+KaOIB
Ged1+vzz+hcvbdEoeK5lDroQtcoFryo4W7ecw4XvfzwtZKPbXpf/6p+4GTb2zT/09yC/w/F/
yaUa5Rcw6D+lnf8RMXF0TliE/u8D1/+vjnf627nRM9+JRfGPGMf/7GDrP0m26795tus/i9H/
fTAFqUS1ygu41G0u67C8+lT+m92AFf+pkapdmKYJu1cTQPmPG9f/lazyMcYYOv8x2vmf0ii2
/ptzIPq/D6anMMukmunSfxACgsXdzTUEAsxh0G3QJW+KHIIazHThoa5NQN3PyH7IyGxGtsmo
19uJ9X4TgtsQgoqbK8P/CIIgCIIgCIIgCIIgCIIgCIL8Ce8lHiKlACgAAA==
--------------040400090603090202080303--

