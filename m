From: "Huber, George K RDECOM CERDEC STCD SRI"
	 <George.K.Huber@us.army.mil>
Subject: RE: Static memory allocation
Date: Fri, 24 Sep 2004 10:21:25 -0400
Sender: gcc-help-owner@gcc.gnu.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138537@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <gcc-help-return-18023-gcc-help=m.gmane.org@gcc.gnu.org>
List-Unsubscribe: <mailto:gcc-help-unsubscribe-gcc-help=m.gmane.org@gcc.gnu.org>
List-Archive: <http://gcc.gnu.org/ml/gcc-help/>
List-Post: <mailto:gcc-help@gcc.gnu.org>
List-Help: <mailto:gcc-help-help@gcc.gnu.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Ankit Jain' <ankitjain1580@yahoo.com>, gcc <gcc-help@gcc.gnu.org>, linux prg <linux-c-programming@vger.kernel.org>

Ankit wrote:

>[ankit@Ankit fft]$ cat try2.c
>#include <stdio.h>
>int main()
>{
>  double a[1450][1450];
>  a[1450][0]=999.999;
>  printf("%lf\n",a[1450][0]);
>  return 0;
>}
>[ankit@Ankit fft]$ gcc try2.c
>[ankit@Ankit fft]$ ./a.out
>Segmentation fault
>[ankit@Ankit fft]$

This is a classic `off-by-one' error.  When you allocate an
array int a[10] you are asking for ten storage locations that 
are numbered 0 -- 9. (not 10).

In your program, the legal range for each index is 0-1449 (not 1450).

George
