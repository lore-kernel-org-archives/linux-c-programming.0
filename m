From: Progga <abulfazl@juniv.edu>
Subject: Re: dynamic linking
Date: Mon, 9 Sep 2002 20:39:39 +0000
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <200209092039.39308.abulfazl@juniv.edu>
References: <200209082200.26275.wrazlov@gmx.net> <200209082306.27699.freyther@gmx.net> <200209091306.17099.wrazlov@gmx.net>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_3QU6IYZL7VWN861LT4J4"
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200209091306.17099.wrazlov@gmx.net>
List-Id: <linux-c-programming.vger.kernel.org>
To: wrazlov@gmx.net, linux-c-programming@vger.kernel.org


--------------Boundary-00=_3QU6IYZL7VWN861LT4J4
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday 09 Sep 2002 11:06 am, Wrazlov wrote:
> > Hi,
> > I'm new to this list and actually didn't read the faq but man dlopen =
is
> > your friend.
> > After dlopening you need to dlsym the 'entry point' of your plugin
>
> Thanks for that, but that's only one part, for I don't know how to comp=
ile
> such a lib.so?
> Is it possible to import let's say a class using dlopen?
>

    Please see whether libtool and libltdl can help you. I just had a gli=
mpse=20
of "$info libtool".=20

Khoda Hafez
Progga

** I once learned to use "libtool"  and wrote a nano manual for future =20
   reference. I have attached it with the mail.

--------------Boundary-00=_3QU6IYZL7VWN861LT4J4
Content-Type: text/plain;
  charset="iso-8859-1";
  name="LIBTOOL.TXT"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="LIBTOOL.TXT"




                                 Manual de libtool
                            ***************************
                                     ( 1.0 )


                "libtool" is the programme for creating static and shared libraries .

   It's part of the GNU binutils ( Binary Utilities ) . The tool for creating Dynamic

   linker libraries is "dlltool" which isn't present in the Redhat Linux 7.0

   distribution .



         To create a static library , do the following :


         $ c++ -c del.c++  ( this will create del.o - the object code )


         $ ar cru libdel.a del.o   ( this will create libdel.a - the static library )

         $ ranlib libdel.a   ( this will test libdel.a )




         To create a shared library , do the following :



         $ libtool c++ -c del.c++  ( this will create del.lo )

         $ libtool c++ -o libdel.la del.lo -rpath /usr/lib

        ( this will create libdel.la and libdel.so , libdel.so.0 etc in the .libs

          directory which is hidden . )



          Now copy the libdel.so , libdel.so.0 and libdel.so.0.0.0 to the /usr/lib

  directory . The  "-rpath" option is needed to create the *.so files , though it

  won't place them in the /usr/lib directory . It's a good practice to test the del.c++

  file before making it a shared or static library by combining it with any C++ file

  having the main function . The strace utility can be a handy tool to watch the linking

  process if anything goes wrong . Various libraries are located in the /usr/lib/*

  directories and are loaded successfully while execution takes place , but I have

  so far failed to use this feature . So the new libraries must be placed in the /usr/lib

  or the /lib directory instead of /usr/lib/* or /lib/* directories .




  ** To use strace write "$ strace executive_file_name " and press enter .


  *** The argument for "-rpath" option can be any valid pathname instead of /usr/lib .











--------------Boundary-00=_3QU6IYZL7VWN861LT4J4--

