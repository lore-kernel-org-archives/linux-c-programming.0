From: "J." <mailing-lists@xs4all.nl>
Subject: convert INT to CHAR but print's BEEP...
Date: Wed, 12 Nov 2003 05:35:20 +0100 (CET)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0311120519210.31743-100000@hestia>
References: <20031110173743.GA975@velka.phys.uoa.gr>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20031110173743.GA975@velka.phys.uoa.gr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Wednesday, November 12 05:19:21

Hello, I have kind of a problem with converting an int to a char.
The get_rand_str() function returns an string build of random 
charaters with a max length of int `MAX'.

This seems to work at first glance: 
~: ./program 
qqxfrd

However if I examen the output closer:
~: ./program | od -a
0000000   q   q soh   x stx   f etx   r eot   d enq  nl
0000014

Now I know why my computer keeps beeping everytime it
outputs a string :-)

What is the correct way of changing the int value to a
char value so that I can append it to the return string ?

char *get_rand_str(int max) {
 int i = 0;
 char value;
 char *retval = NULL;

 for(; i < max; i++) {
  value = get_ascii_code(97, 122);
  retval = (char *)realloc(retval, sizeof(char));
  strcat(retval, &value);
 }

 return retval;
 free(retval);
}

int get_ascii_code(int low, int high) {
 int k = 0;
 double d = 0;

 d = (double)rand() / ((double)RAND_MAX + 1);
 k = (int)(d * (high - low + 1));
 return(low + k);
}

Thank you.... 

J.

--
KonkyFong

