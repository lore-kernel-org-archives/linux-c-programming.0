From: Adrian Popescu <adix@vendio.ro>
Subject: Re: comparing char to other known char's
Date: Thu, 23 Jun 2005 16:10:54 +0300
Message-ID: <200506231610.55260.adix@vendio.ro>
References: <42B9F2C7.2030205@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42B9F2C7.2030205@colannino.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: James Colannino <james@colannino.org>
Cc: linux-c-programming@vger.kernel.org

On Thursday 23 June 2005 02:22, James Colannino wrote:
> Hey everyone.  I hope this isn't a stupid question.  I've been googling
> around trying to find a function that I can use but haven't been
> successful.  Here's what I want to be able to do:
>
> let's say I have a char called 'character.'  I want to compare
> 'character' to see if it's any one of the characters in a list.  For
> example, maybe I would want to test character to see if it's either 'e',
> 'r', '*', etc.
>
> Is this easy enough to implement?  I could do if (character == 'e' ||
> character == [...] and so on and so forth, but this seems much to
> tedious and unreadable to be my only solution.  If anyone has any ideas
> I'd be extremely grateful :)  Thanks very much in advance.
>
> James

the way you put it ( if (character == 'e' || ....) ; it is TRUE if 
any (or only one) from those chars exists ; 
perhaps you should be more specific


here is a starting point: 

#include <stdio.h>

#define haystack "abcdefgr*dsfsdfdfs"
#define needle "rte*"

int find_char(char *str , char ch) {
int i=0;
 while (str[i] != '\0') {
   if (ch==str[i]) return ch;
   i++;
 }
return 0;
}

int main (){
char *cp;
int i;
int n=0;

cp=needle;

while (cp[n] !='\0') {
 i=find_char (haystack, cp[n]);
 if(i) printf ("found dec: %d char: %c\n", i, i);
 n++;
}

}


--
Adrian
