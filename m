From: =?ISO-8859-1?Q?Ga=EBl_Deest?= <GUtopiste@free.fr>
Subject: Strange segmentation fault with threads / xlib
Date: Sun, 30 Nov 2003 15:28:16 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3FC9FE80.3060101@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

I wrote this small program (Yes I know, that is stupid, horrible and
useless, but everybody has to learn :-) :

#include <stdio.h>
#include <pthread.h>
#include <X11/Xlib.h>

#define DisplayName NULL
#define DefaultWindowWidth 640
#define DefaultWindowHeight 480

Display *XDisplay;

Window MainWindow;
GC GraphicsContext;
int Border,Background;

static int quit_handler() {
  printf("Window closed manually ! Program terminated..\n");
}

static void XMain(void *parm) {
  XEvent Event;
  int Quit;
  Quit = 0;
  XSelectInput(XDisplay, MainWindow, ExposureMask | StructureNotifyMask
| ButtonPressMask);
  XDrawLine(XDisplay,MainWindow, GraphicsContext, 0, 0,
DefaultWindowWidth,DefaultWindowHeight);
  for(;;) {
    XNextEvent(XDisplay, &Event);
    switch (Event.type) {
    case ButtonPress:
      printf("Bouton %i ! (%i ; %i)
\n",Event.xbutton.button,Event.xbutton.x,
         Event.xbutton.y);
      break;
    case Expose:
      XDrawLine(XDisplay,MainWindow, GraphicsContext, 0, 0,
DefaultWindowWidth,DefaultWindowHeight);
      break;
    }
    if (Quit) break;
    XFlush(XDisplay);
  }
}

int main(int argc, char *argv[]) {

  pthread_t EventThread;
  pthread_attr_t *EventThreadAttr;

  XEvent
Event; 

/* Here is the problem (!) */

  XInitThreads();
  XSetIOErrorHandler(quit_handler);
  XDisplay = XOpenDisplay(DisplayName);
  if (XDisplay==0) {
    printf("XOpenDisplay : Error ; exiting 1.\n");
    exit(1);
  } else {

    printf("XOpenDisplay : Success.\n");
  }


  Border = BlackPixel(XDisplay, XDefaultScreen(XDisplay));
  Background = WhitePixel(XDisplay, XDefaultScreen(XDisplay));

  MainWindow =
XCreateSimpleWindow(XDisplay,XRootWindow(XDisplay,XDefaultScreen(XDisplay)),

20,20,DefaultWindowWidth,DefaultWindowHeight,2,Border,Background);
  if (MainWindow==0) {
    printf("XCreateSimpleWindow : Error ; exiting 1.\n");
  } else {
    printf("XCreateSimpleWindow : Success.\n");
  }

  XMapWindow(XDisplay,MainWindow);
  GraphicsContext = XCreateGC(XDisplay,MainWindow,0,NULL);
  XSetForeground(XDisplay, GraphicsContext, Border);
  XFlush(XDisplay);


  pthread_attr_init(EventThreadAttr);
  if (pthread_create(&EventThread,EventThreadAttr,(void*)XMain,NULL) != 0) {
    printf("Error Creating XMain thread ! Exiting 1.\n");
    exit(1);
  }
  while(1) {
  }
}

Which I compile using the following commandline :
gcc xlibtest.c -o xlibtest -L/usr/X11R6/lib -lpthread -lX11

_This_ DOES work. The program is acting exactly as expected. But you may
have noticed the useless declaration "XEvent Event;" at the beginning of
main(). I tried to remove it, and the program crashes with "Segmentation
fault." Yes, simply by removing a useless local scope variable
declaration. I can't use gdb because then the program receives SIGSEGV
all times. It looks like it's not very good at debugging threaded programs.

I'm using :

- GCC 3.3.2
Configured with: ../gcc-3.3.2/configure --prefix=/usr --enable-shared
--enable-threads=posix --enable-__cxa_atexit --disable-checking
--with-gnu-ld --verbose --target=i486-slackware-linux
--host=i486-slackware-linux

- LD 2.14.90.0.7 20031029 (Sounds like a CVS snapshot ? Probably, I
upgraded it with the development version of my distro. Could it be the
problem ?)
- Linux 2.6.0-test9 (Yes, again a test-version :-/ Am simply fond of it.)

May anyone have a look, and tell me where is the problem in my code, or
if there is a need to make a bug report ?


