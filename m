From: "J." <mailing-lists@xs4all.nl>
Subject: Re: Start of the time slice
Date: Mon, 5 Jul 2004 14:35:28 +0200 (CEST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407051427430.5695-100000@hestia>
References: <7F11C0CADA50AF4690BF42F715ABFBF86468B1@battaexch22.mol.hu>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <7F11C0CADA50AF4690BF42F715ABFBF86468B1@battaexch22.mol.hu>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

On Mon, 5 Jul 2004, [iso-8859-2] Nagy Imre (Vecs=E9s) wrote:
> Dear List,
>=20
> Excuse me, my English is limited, but I try to formulate clearly.
>=20
> I would like to konw how many unexpired time is in my process. The no=
rmal
> time slice (10ms) is enough for me, but I want to get run my function=
 right
> at the start of time slice.=20
>         _______________           ______________
> ____ ... 10 ms         __ . . . __  10 ms       ___
>=20
>         |my f()                   |my f()
>=20
> main()
>=20
> {
> .
>=20
> while(1) {
>    f();
> }
> .
>=20
> Best regards,
>=20
> Imre Nagy

I am not quite sure what your question is, but my best guess is that yo=
u
are asking how to time parts of your c code ??

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include <sys/resource.h>

#define CPU_TIME (getrusage(RUSAGE_SELF,&ruse), ruse.ru_utime.tv_sec + =
\
  ruse.ru_stime.tv_sec + 1e-6 * \
  (ruse.ru_utime.tv_usec + ruse.ru_stime.tv_usec))

/* get resource limits and usage */
extern int getrusage();
struct rusage ruse;

int main(void) {
 double first, second;
 time_t start, end;

 /* record start time... */
 time(&start);
 first =3D CPU_TIME;

 /* produce some cpu cycles... */
 /* put your code to be timed here.. */
 /* .... */

 /* end time.. */
 second =3D CPU_TIME;
 time(&end);

 /* print the results */
 printf("cpu  : %.2f secs\n", second - first);=20
 printf("user : %d secs\n", (int)(end - start));
}

-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
