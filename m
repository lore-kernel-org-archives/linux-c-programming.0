From: "Mikael Aronsson" <mikael-aronsson@telia.com>
Subject: Re: convert INT to CHAR but print's BEEP...
Date: Wed, 12 Nov 2003 08:11:28 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <00ab01c3a8ec$311abd10$bf95d1d9@PC128>
References: <Pine.LNX.4.21.0311120519210.31743-100000@hestia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hi !

The problem with strcat is that you cannot just use a pointer to the
character because all C string functions require that you end the string
with a zero (0) byte.

You could do something like this for eample:
char temp[ 2];
temp[ 0] = my_character;
temp[ 1] = '\0';
strcat( org_string, temp);

Mikael

----- Original Message ----- 
From: "J." <mailing-lists@xs4all.nl>
To: <linux-c-programming@vger.kernel.org>
Sent: Wednesday, November 12, 2003 5:35 AM
Subject: convert INT to CHAR but print's BEEP...


> Wednesday, November 12 05:19:21
>
> Hello, I have kind of a problem with converting an int to a char.
> The get_rand_str() function returns an string build of random
> charaters with a max length of int `MAX'.
>
> This seems to work at first glance:
> ~: ./program
> qqxfrd
>
> However if I examen the output closer:
> ~: ./program | od -a
> 0000000   q   q soh   x stx   f etx   r eot   d enq  nl
> 0000014
>
> Now I know why my computer keeps beeping everytime it
> outputs a string :-)
>
> What is the correct way of changing the int value to a
> char value so that I can append it to the return string ?
>
> char *get_rand_str(int max) {
>  int i = 0;
>  char value;
>  char *retval = NULL;
>
>  for(; i < max; i++) {
>   value = get_ascii_code(97, 122);
>   retval = (char *)realloc(retval, sizeof(char));
>   strcat(retval, &value);
>  }
>
>  return retval;
>  free(retval);
> }
>
> int get_ascii_code(int low, int high) {
>  int k = 0;
>  double d = 0;
>
>  d = (double)rand() / ((double)RAND_MAX + 1);
>  k = (int)(d * (high - low + 1));
>  return(low + k);
> }
>
> Thank you....
>
> J.
>
> --
> KonkyFong
>
> -
> To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

