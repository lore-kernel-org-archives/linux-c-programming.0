From: Mohammed Khalid Ansari <khalid@ncst.ernet.in>
Subject: strange behavious
Date: Sat, 21 Dec 2002 10:55:12 +0530 (IST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.33.0212211051440.20373-100000@soochak.ncst.ernet.in>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux c programming mailing list <linux-c-programming@vger.kernel.org>


Hi,

I was running a simple program to test two dimensional pointer. When I 
compiled it and executed, it received segmentaion fault, but when I 
checked it in debugger step by step, it went smoothly and produced the 
expected output. I did it many times and got the same behavious. Following 
is my program

###################

#include <stdio.h>

void parse (char **);
char	*words[] = {"mohammed", "khalid", "ansari"}; 
int main()
{
	int	num_words, i;
	
	parse (words);
	for (i=0; i<3; i++)
		printf ("%s\n", *(words+i));
	return 0;
}

void
parse (char *word[])
{
	char	*buf[] = {"abc", "bcd", "cde"};
	int	i=0;
	
	for (i=0; i<3; i++)
		strcpy (*word++, buf[i]);
}

##########

Please try yourself and see. What could be the problem.

with regards...

-- 

**************************************************************************

Mohammed Khalid Ansari                    Tel (res) : 0091-022-3051360
Assistant Manager II                          (off) : 0091-022-2024641
National Centre for Software Technology   Fax       : 0091-022-2049573 
8th flr,Air India Build. Nariman Point,   E-Mail    : khalid@ncst.ernet.in 	
Mumbai 400021.

Homepage : http://soochak.ncst.ernet.in/~khalid			  	  

**************************************************************************

