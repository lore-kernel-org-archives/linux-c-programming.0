From: Martin Buchan <M.J.Buchan@gre.ac.uk>
Subject: segfault with strdup
Date: Tue, 20 May 2003 12:20:34 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030520112034.GZ674@gre.ac.uk>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

I have built a C program which parses an XML file containing
application names and the command to run those applications. Once i
parse the file, i then build a GTK menu - like the GNOME start
button thingy with all the apps put into their relevant sections. I.e.

Internet    -> Web Browsers -> Mozilla Web Browser
                            -> Netscape Navigator 
                            -> Lynx Text Only Browser

            -> Email        -> Mozilla Mail
                            -> Mutt
		  
Programming -> Anjuta
            -> Sun Forte



Etc etc.

How i build the menu is by parsing the XML file and sticking the
results in an array of structs and then looping thru the array and
building the buttons, submenu and menu entries.

This is all working now, however, it only works if i run it in the
directory that i have done all my coding in. I.e. If i compile and
install to a different location, i get a seg fault when parsing the
XML file. Its not that it cant find the file, it goes thru and
parses the first entry in the file and then croaks on the 2nd
while parsing the name of the app - which is "Netscape Navigator"
If i shorten the name to just "Netscape", it then croaks on the 3rd
entry which is "Lynx Text Only Browser", if i then shorten this to
just "Lynx Browser", it then croaks on the 4th and so on and so on.

I have some #define 's which state the location of some of my files
like so:

#define APPLIST "/home/bm98/prg/gtk-menu/current/applist.xml"
#define XPMDIR "/home/bm98/prg/gtk-menu/current/xpms/"
#define HELPDIR "/home/bm98/prg/gtk-menu/current/help/"

If i use these locations, it works fine but if i change it to 

#define APPLIST "/home/bm98/menu/applist.xml"
#define XPMDIR "/home/bm98/menu/xpms/"
#define HELPDIR "/home/bm98/menu/help/"

It doesnt work. (Ultimately i want to get these values from a
./configure script with a --prefix=XXX so that i dont need to 
hard code it etc)

Here is my struct

struct menuentry
{
  gchar *appsection;
  gchar *sectionxpm;
  gchar *appsubmenu;
  gchar *appname;
  gchar *appcommand;
};
			 
typedef struct menuentry menuentry;
			 
And here is how i allocate space for it.

menuentry *mePtr = malloc( n * sizeof (menuentry) );


As i say, this works fine for the first set of locations, but not
for the second.

The place where it is seg faulting is

uri = xmlGetProp(cur, "name");
mePtr[i].appname = strdup(uri);  /* HERE */

Here is some output from DDD:

#3  0x123fc in parseApp (doc=0x3d450, cur=0x39c98, mePtr=0x29708, i=1) at menu-0.9.1.c:207
#2  0xfeccf2a4 in strdup () from /usr/lib/libc.so.1
#1  0xfecc1c90 in malloc () from /usr/lib/libc.so.1
#0  0xfecc1c48 in _smalloc () from /usr/lib/libc.so.1


Can anyone spot anything from this info where I am going wrong. I
will gladly post more info from ddd or more of my source code if
this will help.


Thanks
Martin
