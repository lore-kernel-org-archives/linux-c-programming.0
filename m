From: Scott <drmemory@3rivers.net>
Subject: Initializer element is not constant
Date: Thu, 20 Jan 2005 16:21:32 -0700
Message-ID: <20050120232132.GE1279@drmemory.local>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Hi,

It has been a LONG TIME since I've done any programming in C. I have
two old programs still in use which were developed on msdos, using the
"Mark Williams Let's C" compiler. We're talking 1980's stuff here.

Anyway, I thought to try to port them to linux. Can anyone tell me
what I'm doing wrong?

Here are the relevant portions of indatax.c:

char *namectrl = NULL;
char *name1 = NULL;
char *name2 = NULL;

typedef struct {
	char *var;	/* destination for storage of the data */
	size_t len;	/* max len of the data */
	char *(*xlat)();	/* translation routine */
} DATUM;

DATUM recip_data[] = {
{  namectrl, NAMECTRL_LEN, make_upper },
{  name1, NAME1_LEN, make_upper },
{  name2, NAME2_LEN, make_upper },
[...]

And these are the errors...

indatax.c:124: initializer element is not constant
indatax.c:124: (near initialization for `recip_data[0].var')
indatax.c:125: initializer element is not constant
indatax.c:125: (near initialization for `recip_data[1].var')
indatax.c:126: initializer element is not constant
indatax.c:126: (near initialization for `recip_data[2].var')
[...]

gcc version 2.95.3

Thanks,

Scott Swanson
Pendroy, Montana
