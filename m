From: Elias Athanasopoulos <elathan@phys.uoa.gr>
Subject: Re: dynamic allocation of array of structures
Date: Sat, 22 Mar 2003 23:00:44 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20030322230044.B6857@neutrino.particles.org>
References: <20030322202720.267284000B9@mwinf0501.wanadoo.fr> <Pine.LNX.4.21.0303222141500.5852-100000@hestia>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0303222141500.5852-100000@hestia>; from mailing-lists@xs4all.nl on Sat, Mar 22, 2003 at 09:48:12PM +0100
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J." <mailing-lists@xs4all.nl>
Cc: linux-c-programming@vger.kernel.org

On Sat, Mar 22, 2003 at 09:48:12PM +0100, J. wrote:
> Maybe some of you could give a hunch what goes wrong. 

You should use linked lists. The code below can work if you save
the starting offset of you elements, but in general it is not safe.


> #include <stdio.h>
> #include <stdlib.h>
> 
> typedef struct {
>  char initial;
>  int roomnr;
> } record;
> 
> int main(void) {
>  int i = 0;

-  record *ptr;
+  record *ptr, *t;

>  if((ptr = (record *)malloc(10 * sizeof(record))) == NULL) {
>   fprintf(stderr, "Error: failed malloc\n");
>   return 1;
>  }

+  t = ptr;

>  for(i = 0; i < 10; i++, ptr++) {
>   ptr->initial = 'A' + i;
>   ptr->roomnr = i;
>  }

+  ptr = t;

>  for(i = 0; i < 10; i++, ptr++) {
>   printf("ptr->initial = %c, ", ptr->initial);
>   printf("ptr->roomnr = %d\n", ptr->roomnr);
>  }
> 
>  return 0;
> }

Elias

-- 
University of Athens			I bet the human brain 
Physics Department				is a kludge --Marvin Minsky 

	
