From: "J." <mailing-lists@xs4all.nl>
Subject: obstack_alloc & _obstack_newchunk
Date: Wed, 23 Feb 2005 13:45:35 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0502231316180.1636-100000@hestia>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Wednesday, February 23

Hello, I am looking into the GNU's obstack lib .

Unfortunatly it segfaults. According to a backtrace of the program stack
it goes down at obstack_newchunk_ . To be honest I am kind a stuck here.

There is enough free memory available since I am able to write this
message... The only thing I can come up with is that obstack_alloc trys
to add new memory to the address of string_obstack, which isn't properly
setup by moi.. ?

#include <stdio.h>
#include <string.h>
#include <obstack.h>

struct obstack string_obstack;

char *copystring(char *string);

int main(void) {
 char *orig = "to copy this string";
 char *str = NULL;

 str = copystring(orig);
 printf("%s\n", str);

 return 0;
}

char *copystring(char *string) {
 size_t len = 0;
 char *s = NULL;

 len = strlen(string) + 1;

 s = obstack_alloc(&string_obstack, len);
 memcpy(s, string, len);

 return s;
}

Thnkx..

J.

--
http://www.rdrs.net/

