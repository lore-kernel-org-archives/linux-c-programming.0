From: Rechberger Markus <mrechberger@gmail.com>
Subject: Re: getopt() library function options
Date: Sat, 5 Mar 2005 14:37:19 +0100
Message-ID: <d9def9db05030505372bc1a63c@mail.gmail.com>
References: <d9def9db05030501573360eeab@mail.gmail.com>
	 <Pine.LNX.4.21.0503051244020.903-100000@hestia>
Reply-To: Rechberger Markus <mrechberger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.21.0503051244020.903-100000@hestia>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

On Sat, 5 Mar 2005 13:18:26 +0100 (CET), J. <mailing-lists@xs4all.nl> wrote:
> On Sat, 5 Mar 2005, Rechberger Markus wrote:
> 
> > Hey,
> 
> Hey.. ;-)
> 
> > regarding atoi:
> >
> > #include <stdio.h>
> 
> #include <stdlib.h>
> 
> > int main(){
> >         printf("value: %d\n",atoi("nosegv123"));
> >         return(0);
> > }
> > output:
> > value: 0
> >
> > this doesn't segfault
> 
> Yes, - atoi in stdlib.h is actually strtol...
> 
> But, the answer was about using atoi in combination with
> getopt(), maybe it was my lack of explanation sorry...
> Anyway, atoi(optarg) while there is no optarg will segfault...

for that case we have the doublepoint in optarg which says that it
needs an argument otherwise it would return for example:
./main: option requires an argument -- n

value=atoi(optarg)
if(value==0&&*optarg!='0'){
  printf("invalid argument\n");
  exit(1);
}

this doesn't check overflow/underflow strtol would probably be better
in that case.. the manpage explains this quite accurate..

Markus

> Then, you will always want to check for digits, since atoi
> can't determine the difference inbetween the argument `0'
> or "nosegv123" . atoi returns the same value for both, thus `0' .
> 
> If your program checks something INT times and atoi returns `0'
> even on errorlike user input, the program will check `0' times..
> 
> #include <stdio.h>
> #include <stdlib.h>
> 
> int main(int argc, char *argv[]){
>  char *str1 = "nosegv123";
>  char *str2 = "0.012";
>  char *str3 = "0";
>  char *str4 = "-1";
> 
>  printf("str: %s - value: %d\n",str1, atoi(str1));
>  printf("str: %s - value: %d\n",str2, atoi(str2));
>  printf("str: %s - value: %d\n",str3, atoi(str3));
>  printf("str: %s - value: %d\n",argv[1], atoi(argv[1]));
>  printf("str: %s - value: %d\n",str4, atoi(str4));
>  return(0);
> }
> 
> > ctype only takes one variable as argument _not_ a string, he would
> > have to check every element of the array with isdigit.
> 
> Yep.. But *pointers are quite cheap these days I hear.. ;-)
> 
> Thnkx..  J.
> 
> > > int isthisanint(char *str) {
> > >  regex_t re;
> > >  int retval = -1;
> > >
> > >  setlocale(LC_ALL, "");
> > >  if(regcomp(&re, "^([0-9]*)$", REG_EXTENDED) != 0) {
> > >   fprintf(stderr, "%s: Error - Unable to compile regex", PACKAGE);
> > >   return -1;
> > >  }
> > >
> > >  if(regexec(&re, str, 0, NULL, 0) != 0)
> > >   retval = -1;
> > >  else
> > >   retval = atoi(str);
> > >
> > >  /* or.. Like listed in the manual page */
> > >  /*  strtol(nptr, (char **)NULL, 10); */
> > >
> > >  regfree(&re);
> > >  return retval;
> > > }
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
