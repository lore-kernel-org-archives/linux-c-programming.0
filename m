From: Edward Parrilla <eparrilla@comcast.net>
Subject: Question about Malloc
Date: 10 Oct 2004 00:31:05 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1097386256.6100.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

Hi all,
I got the following structure:
typedef struct  {
 	char *file;
	char *ip_addres;
	}TABLE;

then define a pointer to it:

typedef TABLE *Recpointer;
Recpointer r;


I'm trying to use malloc as:

r=malloc(Recpointer);
but it gives me error.

What should be the right sintax?

Any help would be appreciated.
Thanks in advance

Ed

