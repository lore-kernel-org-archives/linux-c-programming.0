From: "J." <mailing-lists@xs4all.nl>
Subject: value computed is not used ??
Date: Tue, 1 Jun 2004 03:41:22 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0406010333220.1813-100000@hestia>
References: <20040531193810.GE31833@opaque>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20040531193810.GE31833@opaque>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Tuesday, June 01 03:33:22

Hi ...

When I try to compile the listed program, with gcc version 2.95.4 20011002
and the command `gcc -Wall program.c -o program` It gives me a warning
message like: warning: value computed is not used

The program works perfectly fine, as far as I can judge the code isn't
wrong in any way ? And the value is certainly used.. Unfortunatly this
message shows to many times when I try to compile other code at my system.

Can anyone explain to me what the sense behind that warning is ? And what
to do about it ? e.g. what the ``better way`` of coding would be?

#include <stdio.h>

int main(void) {
 char *ptr = NULL;
 char str[] = "whats up";

 for(ptr = str; *ptr; *ptr++) {
  printf("%c", *ptr);
 }

 printf("\n");
 return 0;
}

Thnkx a lot...

Jeroen.

