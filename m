From: "J." <mailing-lists@xs4all.nl>
Subject: Re: comparing char to other known char's
Date: Fri, 24 Jun 2005 09:57:19 +0200 (CEST)
Message-ID: <Pine.LNX.4.21.0506240936200.565-100000@hestia>
References: <42BB52E4.5090504@colannino.org>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <42BB52E4.5090504@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, 23 Jun 2005, James Colannino wrote:

> Eric Bambach wrote:
> 
> > Generally speaking (in terms of input validation), its better practice to 
> > check against a LEGAL set of characters rather than an illegal set. That way 
> > you can get all the characters you need, but everything else is blocked. If 
> > you block illegal ones you're bound to miss a few or even ones from extended 
> > charsets and input methods that you might not have thought of that could 
> > wreck havoc in your program.
> 
> Here's what I've whipped up based on your suggestion that I should look
> for legal characters instead of the other way around:
> 
> <CODE>
> 
> /* This function returns 1 if the character being checked is legal and 0
> if it isn't. */
> 
> int legal_characters(char character_to_check) {
> 
> 	int index;
> 	legal_characters[] =
> "abcdefghijklmnopqrstuvwxyzAVCDEFGHIJKLMNOPQRSTUVWXYZ1234567890_-";

I'm not going to repeat all the answers you already had, but you know the
#include <ctype.h> ? 

The above [abcdef... ABC. etc..] `man ascii' e.g.

uppercase alpha (c >= 65 && c <= 90) , 
lowercase alpha (c >= 97 && c <= 122),
numerals ... (c >= 48 && c <= 57) etc..

or with ctype.h ... isdigit(), isalnum() .....

#include <stdio.h>
#include <ctype.h>

int legal_characters(char ch) {
 register int retv = -1;

 if(isalpha(ch) || isdigit(ch) || ch == '-' || ch == '_')
  retv = 1;
 else
  retv = 0;

 return retv;
}

int main(void) {
 char c;

 while((c = getchar()) != EOF) {
  if(legal_characters(c))
   putchar(c);
 }

 return 0;
}

You could also use the ctype macro's grouped together in your own defined
macro..

Maybe it's good to point out that the users of your program can also 
be chinese users and other `foreign' users that use different character 
sets that do not fit into the 1 byte character..

Cheers..

J.

> 	int number_of_legal_chars = sizeof(legal_characters) / sizeof(char);
> 
> 	for (index = 0; index < number_of_legal_chars; ++index) {
> 		if (character_to_check == legal_characters[index])
> 			return 1;
> 	}
> 
> 	return 0;
> 
> </CODE>

