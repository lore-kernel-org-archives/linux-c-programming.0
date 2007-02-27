From: Jesse Ruffin <jesse@ajp-services.net>
Subject: Re: Multiple declaration problem
Date: Tue, 27 Feb 2007 13:57:55 -0500
Message-ID: <200702271358.04831.jesse@ajp-services.net>
References: <45E05E83.5010005@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2375855.oyCuUYgdFC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <45E05E83.5010005@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
To: linux-c-programming@vger.kernel.org

--nextPart2375855.oyCuUYgdFC
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

The problem, as I understand it, is that you are instantiating a variable i=
n a=20
header and you need it's value in another header.


It seems that the best solution would instead be to move the variable=20
instantiation into the source file, keep the declaration in the header if y=
ou=20
still need visibility. To synchronize the value of the variable and the=20
function, you should use a #define or const. Using a variable will not give=
=20
you a dynamic default anyway, as it is evaluated at compile time. Try=20
something like this:

in the header:
#define DEFAULT_ENGINE =3D NONE //could use const int CURRENT_ENGINE
int lawCurrentEngine; //declaration only, if you need it

in source:
lawCurrentEngine =3D DEFAULT_ENGINE; // NONE has been enum-med previously

in other header:
int lawCloseEngine ( int engineID =3D DEFAULT_ENGINE );

Now that I've written this, it looks like you may be trying to get a dynami=
c=20
default. You can't actually do that, but you can get close with a file stat=
ic=20
variable. i.e.:

in source:

static currentEngine =3D NONE;

int lawCloseEngine( int engineID =3D NONE ) {
	if( engineID =3D=3D NONE ){
		if (currentEngine !=3D NONE) lawRealCloseEngine(currentEngine);
		currentEngine =3D NONE;
		return SUCCESS;
	} else {
		lawRealCloseEngine(engineID);
		return SUCCESS;
	}
	return FAIL;	//Should never happen.
}

Hope this helps

Jesse Ruffin
AJP Services

On Saturday 24 February 2007 10:49, Shriramana Sharma wrote:
> Hello. I have a problem with multiple declaration in a project I am
> working on. I have constructed a similar testcase which throws the same
> kind of error. Please see the files in the attachment. -g or -g3 did not
> give any useful debugging symbols, I don't know why. The following is
> the session transcript:
>
> $ ls
> main.cpp  myheader.cpp  myheader.h
> $ g++ -c main.cpp
> $ g++ -c myheader.cpp
> $ g++ -o main main.o myheader.o
> myheader.o:(.data+0x0): multiple definition of `b'
> main.o:(.data+0x0): first defined here
> collect2: ld returned 1 exit status
> $ mv main.cpp main.c
> $ mv myheader.cpp myheader.c
> $ rm *.o
> $ gcc -c main.c
> $ gcc -c myheader.c
> $ gcc -o main main.o myheader.o
> myheader.o:(.rodata+0x0): multiple definition of `a'
> main.o:(.rodata+0x0): first defined here
> myheader.o:(.data+0x0): multiple definition of `b'
> main.o:(.data+0x0): first defined here
> collect2: ld returned 1 exit status
>
> In my project, I need to put the following statement in a header file:
>
> int lawCurrentEngine =3D NONE ; // NONE has been enum-med previously
>
> because I need to declare a function
>
> int lawCloseEngine ( int engineID =3D lawCurrentEngine ) ;
>
> I include the header file containing these two lines in two cpp files,
> and I get a multiple definition error for lawCurrentEngine just like in
> the given test case. If I push the lawCurrentEngine declaration to one
> of the cpp-s (it's not needed in the other cpp) I am unable to provide
> the default argument for the lawCloseEngine which can be done only in
> the header.
>
> I don't understand how I am getting such an error when I have used the
> #ifndef #define #endif technique as per good programming practice.
>
> Please help,
>
> Thanks.
>
> Shriramana Sharma.

--nextPart2375855.oyCuUYgdFC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBF5H888GGeAXLl3osRArP/AJ9UwJK1qWVL4OTFAHf+Z75OYzjjqwCffq45
QA7bd0+BS4Oxs4UhWgXUIQM=
=z6oJ
-----END PGP SIGNATURE-----

--nextPart2375855.oyCuUYgdFC--
