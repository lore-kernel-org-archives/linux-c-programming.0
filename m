From: Edward Parrilla <eparrilla@comcast.net>
Subject: passing host name from a structure.
Date: 06 Oct 2004 16:47:27 -0500
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1097099245.4086.421.camel@localhost.localdomain>
References: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041006104403.96723.qmail@web52903.mail.yahoo.com>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux prg <linux-c-programming@vger.kernel.org>

Hi Experts,
here a question for you, I have defined the following


#define bcopy(a,b,c) strncpy(b,a,c)


   struct sockaddr_in  sa;  /* socket addr. structure           */
   struct hostent * hp;     /* host entry                       */
   char *hostname;

hostname=argv[3];

hp=gethostbyname(hostname);  <-- get this error " warning: assignment
makes pointer from integer without a cast
"


bcopy((char *)hp->h_addr, (char *)&sa.sin_addr, hp->h_length);  <--
getting  dereferencing pointer to incomplete type

Any idea?
thanks in advance
Edward






