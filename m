From: p.boehm@d-trust.net
Subject: RE: -EFAULT during freeing a pointer to a structure
Date: Tue, 5 Oct 2004 17:43:25 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <OFA6DAB128.ACBA7070-ONC1256F24.0054FB89@bln.d-trust.de>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Eric Bambach <eric@cisu.net>

hi,
I've found the error. the problem occurs if MAXNUM or number of array to store pointers of another
structure is odd.
I know that malloc() always allocates memory as multiple of 4 but in my case it is so:

     struct xy {
          int id;        /* sizeof(int)=4 */
          char *name;         /* sizeof(char *)=4 */
     };

     struct abc {
          struct xy *next[7]; /* sizeof(struct xy *) * 7 = 4 * 7 = 28 */
     };

     => all in all 36 bytes, and that's even!

Can someone explain this? (I fears the solution is more than easy ...)
pb

