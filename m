From: "J." <mailing-lists@xs4all.nl>
Subject: Re: getopt() library function options
Date: Fri, 4 Mar 2005 21:37:45 +0100 (CET)
Message-ID: <Pine.LNX.4.21.0503042104250.2159-100000@hestia>
References: <1109910902.595.32.camel@0003ba16bccc>
Reply-To: linux-c-programming@vger.kernel.org
Mime-Version: 1.0
In-Reply-To: <1109910902.595.32.camel@0003ba16bccc>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

On Thu, 3 Mar 2005, Fabio wrote:

> Hello,
> 
> I am coding a small utility for system administrator. The following command line options will be accepted:
> 
> $apstat 
> $apstat -t 1
> $apstat -n 1
> $apstat -t 2 -n 2
> $apstat -v
> $apstat -t 1 -v
> $apstat -v -t 1 -n 2
> 
> unaccepted command line options:
> 
> $apstat -t
> $apstat -n 
> $apstat -t <<non integer value>>
> $apstat -n <<non integer value>>
> 
> I would like that know what would be the while() command that I have to call getopt() 
> inside the case(), for example, I need all this:
> 
> 
>      while ((c = getopt(argc, argv, ":abf:")) != -1) {
>          switch(c) {
>          case 'a':
>               printf("a is set\n");
>               break;
>          case 'b':
>               printf("b is set\n");
>               break;
>          case 'f':
>               filename = optarg;
>               printf("filename is %s\n", filename);
>               break;
>          case ':':
>               printf("-%c without filename\n", optopt);
>               break;
>          case '?':
>               printf("unknown arg %c\n", optopt);
>               break;
>          }
>      }
> 
> 
> This was I got on a getopt() man page, I understand some basic concept, 
> but I cant put the unaccpted arguments to work. Thanks alot if someone
> can build this from scratch.
> 
> Thanks in advance,
> 
> fabio.

Friday, March 03

You could use an regex to determine if your dealing with an INT or
not.. Or check the string with isdigit() <ctype.h>. 

If atoi is used on non-digit conversion the result is a segfault.
Use strtol family instead because atoi can't detect errors. Also 
casting return value's is a bad idea since they can hide errors..

your code with might looklike something like this....

#include <stdio.h>
#include <getopt.h>
#include <stdlib.h>

#include <regex.h>
#include <locale.h>

#define PACKAGE    "getoptex"
#define VERSION    "0.0.1"

void print_help(int exval);
int isthisanint(char *str);

int main(int argc, char *argv[]) {
 int opt;

 /* 
 // no arguments given
 */
 if(argc == 1) {
  fprintf(stderr, "This program needs arguments....\n\n");
  print_help(1);
 }

 while((opt = getopt(argc, argv, "hVvd:f:o:")) != -1) {
  switch(opt) {
   case 'h':
    print_help(0);
   case 'V':
    printf("%s %s\n\n", PACKAGE, VERSION); 
    exit(0);
   case 'v':
    printf("%s: Verbose option is set `%c'\n", PACKAGE, optopt);
    break;
   case 'd':
    printf("%s: isthisanint(%s), says: %d\n", PACKAGE, 
      optarg, isthisanint(optarg));
    break;
   case 'f':
    printf("%s: Filename %s\n", PACKAGE, optarg);
    break;
   case 'o':
    printf("Output: %s\n", optarg);
    break;
   case ':':
    fprintf(stderr, "%s: Error - Option `%c' needs a value\n\n", PACKAGE, optopt);
    exit(1);
   case '?':
    fprintf(stderr, "%s: Error - No such option: `%c'\n\n", PACKAGE, optopt);
    exit(1);
   }
 }

 /* 
 // print all remaining options
 */
 for(; optind < argc; optind++)
  printf("argument: %s\n", argv[optind]);

 return 0;
}

void print_help(int exval) {
 printf("%s,%s show working getopt example\n", PACKAGE, VERSION); 
 printf("%s [-h] [-V] [-v] [-d INT] [-f FILE] [-o FILE]\n\n", PACKAGE);

 printf("  -h              print this help and exit\n");
 printf("  -V              print version and exit\n\n");

 printf("  -v              set verbose flag\n");
 printf("  -d INT          set `-d' to `INT'\n");
 printf("  -f FILE         set intput file\n");
 printf("  -o FILE         set output file\n\n");

 exit(exval);
}

int isthisanint(char *str) {
 regex_t re;
 int retval = -1;

 setlocale(LC_ALL, "");
 if(regcomp(&re, "^([0-9]*)$", REG_EXTENDED) != 0) {
  fprintf(stderr, "%s: Error - Unable to compile regex", PACKAGE);
  return -1;
 }

 if(regexec(&re, str, 0, NULL, 0) != 0)
  retval = -1;
 else
  retval = atoi(str);

 /* or.. Like listed in the manual page */
 /*  strtol(nptr, (char **)NULL, 10); */

 regfree(&re);
 return retval;
}


Hope that gave you some usable idea's... 

GoodLuck..

J.

--
http://www.rdrs.net/

