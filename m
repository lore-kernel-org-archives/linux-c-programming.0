From: "Ardhan Madras" <ajhwb@knac.com>
Subject: Socket programming
Date: Sun, 22 Mar 2009 05:42:20 -0700
Message-ID: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Reply-To: <ajhwb@knac.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi All,

I was written small network utility in Linux 2.6, glibc 2.7.
I have been using send() and recv() system call in SOCK_STREAM
to send or receive fixed size data. for example, i write my data 
structure like this:

struct foo
{
  char name[16];
  char pix[1024];
  int id;
} bar;

If i want to send or receive data i just call

send (socket, &bar, sizeof(struct foo), 0);

or to receive:
recv (socket, &bar, sizeof(struct foo), 0);

My problem is how to receive dynamic sized data? for 
example this structure:

struct foo
{
  char *name;
  char *pix;
  int id;
}

struct foo *bar = malloc (sizeof(struct foo));
/* fill the structure, then send */

How to receive the data? since there are no way
to the receiver to know data sizes?

Thanks for your help.


_____________________________________________________________
Listen to KNAC, Hit the Home page and Tune In Live! ---> http://www.knac.com
