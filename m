From: "Luiz Fernando N. Capitulino" <lcapitulino@terra.com.br>
Subject: Re: array size 1 ? 	All headers
Date: Wed, 21 Jul 2004 09:07:11 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20040721090711.72844a7c.lcapitulino@terra.com.br>
References: <20040721015338.M80608@sni.ph>
	<20040720235713.4cb83b20.lcapitulino@terra.com.br>
	<200407202217.43875.eric@cisu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <200407202217.43875.eric@cisu.net>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: eric@cisu.net
Cc: linux-c-programming@vger.kernel.org

Em Tue, 20 Jul 2004 22:17:43 -0500
Eric Bambach <eric@cisu.net> screveu:

| >  The program:
| >
| >  char tst[1];
| >  tst[0]='g';
| >  tst[1]='r';
| >
| >  printf("%c %c\n", tst[0], tst[1]);
| >
| >  compiles and works here! but to be honest, I don't why. I can prove it is
| > an odd case, becase this also works (here):
| >
| >  char tst[1];
| >  tst[0]='g';
| >  tst[1]='r';
| >  tst[2]='z';
| >
| >  printf("%c %c %c\n", tst[0], tst[1], tst[2]);
| >
| > PS: GCC compiled.
| 
| 
| I think small overflows like this will work because arrays are allocated in 
| multiples of the word size for the artitecture. So char 
| ar[1];
| gets 4 bytes as does char ar[2], char ar[3] and char ar[4].
| char ar[5] will get 8 bytes. So  with ar[1] and ar[5] you can stuff up to 3 
| more charaters until you overwrite critical parts of the stack. Its not an 
| error per se, because the space is given to the array, but its a horrible 
| thing to do in practice.

 Oh yeah, the best pratice is to write right code. :-)


-- 
Luiz Fernando
