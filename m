From: "Colovic (ext_evosoft) Aleksandar" 
	<aleksandar.colovic.external@siemens.com>
Subject: RE: Multithreading with C++
Date: Fri, 8 Apr 2005 08:47:08 +0200
Message-ID: <552918A6F440BC479AD4479FD3A9146A451AC3@ERLD164A.ww004.siemens.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C53C06.C8E11DD5"
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C53C06.C8E11DD5
Content-Type: text/plain;
	charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

Hi,=20

try declaring threadfun as class static function : void* =
CThread::threadfun(void* arg)
Attached is the working code. I built it with make cthread.cpp =
LDFLAGS=3D-lpthread


Cheers



-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org =
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Huber, =
George K RDECOM CERDEC STCD SRI
Sent: Donnerstag, 7. April 2005 19:02
To: linux-c-programming@vger.kernel.org
Subject: Multithreading with C++


All,

This may be a little off topic, but I though I would try here first.

I am writting a multi-threaded program and would like to have each=20
thread `managed' by a class.  I have attempted to do this like this,
using the pthreads library:

<code>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3Dbegin =
cthread.h

class CThread
{
public:
    CThread(void*);
    ~CThread();

    ....

private:
    static CThread*     m_pThis;
    pthread_t             m_tid;
    static void*           threadfun(void*);

   ....
}

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D begin =
cthread.cpp

CThread*  CThread::m_pThis =3D NULL;

CThread::CThread(void* arg)
{
    int      ret;

    m_pThis =3D this;
    if(0 !=3D (ret =3D pthread_create(&m_tid, NULL, threadfun, arg)))
    {
         fprintf(stderr, "Thread creation failed");
   }
}  =20

void*  threadfun(void* arg)
{
     printf("Starting thread\n");
     ....
}

</code>

The code compiles without warnings or errors, except when I try and=20
run the application I get a segmentation fault at the pthread_create. =20
Trying to run under GDB, I am able to examine the value of the=20
variables and they seem consisten with what I would expect

// stop on the pthread_create line in the constructor...

(gdb) print m_pThis
$1 =3D (CThread*) 0xfee756b0
(gdb) print this
$2 =3D (CThread*0xfee756b0
(gdb) print m_tid
$3 =3D 134514818               // to be expected because I have not =
initialized m_tid yet
(gdb) print &m_tid
$4 =3D (pthread_t*)0xfee756d8
(gdb) print threadfun
$5=3D&CThread::threadfun(void*)

// attempt the pthread_create line ....

Program received signal SIGSEGV, Segmenatation fault
0x0000000 in ?? ()
(gdb) where=20
#0 0x00000000 in ?? ( )
#1 0x0804a6bb in CThread (this=3D0xfee756b0, args=3D0x0) at ....
#2 0x08049aad in daemon_main(argc=3D3, argv=3D0xfeec42d4) at ....
#3 0x08049193 in main(argc=3D3, argv=3D0xfeec42d3) at main.cpp: 83

Any idea on what is going on, or how to fix?

Thanks,=20
George Huber

-
To unsubscribe from this list: send the line "unsubscribe =
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

------_=_NextPart_001_01C53C06.C8E11DD5
Content-Type: application/octet-stream;
	name="cthread.h"
Content-Transfer-Encoding: base64
Content-Description: cthread.h
Content-Disposition: attachment;
	filename="cthread.h"

I2luY2x1ZGUgInB0aHJlYWQuaCINCiNpbmNsdWRlICJzdGRpby5oIg0KDQpjbGFzcyBDVGhyZWFk
DQp7DQpwdWJsaWM6DQogICAgQ1RocmVhZCh2b2lkKik7DQogICAgfkNUaHJlYWQoKTsNCg0KDQpw
cml2YXRlOg0KICAgIHN0YXRpYyBDVGhyZWFkKiAgICAgbV9wVGhpczsNCiAgICBwdGhyZWFkX3Qg
ICAgICAgICAgICAgbV90aWQ7DQogICAgc3RhdGljIHZvaWQqICAgICAgICAgICB0aHJlYWRmdW4o
dm9pZCopOw0KDQp9Ow0KDQo=

------_=_NextPart_001_01C53C06.C8E11DD5
Content-Type: application/octet-stream;
	name="cthread.cpp"
Content-Transfer-Encoding: base64
Content-Description: cthread.cpp
Content-Disposition: attachment;
	filename="cthread.cpp"

I2luY2x1ZGUgImN0aHJlYWQuaCINCg0KDQpDVGhyZWFkKiBDVGhyZWFkOjptX3BUaGlzID0gTlVM
TDsKCkNUaHJlYWQ6On5DVGhyZWFkKCkge30NCkNUaHJlYWQ6OkNUaHJlYWQodm9pZCogYXJnKQp7
CiAgICBpbnQgICAgICByZXQ7CgogICAgbV9wVGhpcyA9IHRoaXM7CiAgICBpZigwICE9IChyZXQg
PSBwdGhyZWFkX2NyZWF0ZSgmbV90aWQsIE5VTEwsIHRocmVhZGZ1biwgYXJnKSkpCiAgICB7CiAg
ICAgICAgIGZwcmludGYoc3RkZXJyLCAiVGhyZWFkIGNyZWF0aW9uIGZhaWxlZCIpOwogICB9Cn0g
ICAKCnZvaWQqIENUaHJlYWQ6OnRocmVhZGZ1bih2b2lkKiBhcmcpCnsKICAgICBwcmludGYoIlN0
YXJ0aW5nIHRocmVhZFxuIik7Cn0KCmludCBtYWluKGludCBhcmdjLCBjaGFyKiogYXJndikNCnsN
CglDVGhyZWFkIGN0KDApOw0KCQ0KCXJldHVybiAwOw0KfQ0K

------_=_NextPart_001_01C53C06.C8E11DD5--
