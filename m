From: jshiffer@zerotao.org (Jason L. Shiffer)
Subject: Re: Problem with "chars"
Date: Wed, 17 Jul 2002 09:30:41 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20020717133041.GA13442@zerotao.org>
References: <20020717040816.A54117@nietzsche.metrotel.net.co>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20020717040816.A54117@nietzsche.metrotel.net.co>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Wed, Jul 17, 2002 at 04:08:16AM -0500, xlp wrote:
> I dont understand what's the way I should handle 'chars' on C. 
> I need to code a C function that returns a char, I want to do this:
> char foo();
> main(){
> 	char bar*;
> 	bar=foo();
> }

Firstly if you are just going to return a char ie. some value between
-128 & 127, then the above definition is incorrect:
char bar*;   defines a char pointer most commenly known as a string;
char bar;    defines a char

> How should i declare the 'char' inside foo()?

the same as above eg,
char foo(void){
  char x = 'a';
  return x;
}

> How should i 'return' the char inside foo()?
see the previous example.

> How can i understand "chars" and pointers to chars?, I have a C books, but I dont get it, because ALL THE EXAMPLES are with chars like char foo[20], that is the easy way!, I want to handle char without a specific length!.

The best book that I know of for this is "Expert C Programming (Deep C
Secrets) ISBN:0-13-177429-8.  And don't let the name scare it is a great
book that will take you pretty much from entry level programming to
advanced topics.

As a short introduction you can think about pointers like this:

char a = 'b';  //the symbol a represents the VALUE b
char *b = &a;  //the symbol b represents the MEMORY ADDRESS of the
               //symbol a;

it is a little simplified but I hope that it helps.

Jason
> 
> bye.
> 
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
