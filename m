From: Fabio <fabio@crearium.com>
Subject: getopt() library function options
Date: Thu, 03 Mar 2005 22:35:02 -0600
Message-ID: <1109910902.595.32.camel@0003ba16bccc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Hello,

I am coding a small utility for system administrator. The following command line options will be accepted:

$apstat 
$apstat -t 1
$apstat -n 1
$apstat -t 2 -n 2
$apstat -v
$apstat -t 1 -v
$apstat -v -t 1 -n 2

unaccepted command line options:

$apstat -t
$apstat -n 
$apstat -t <<non integer value>>
$apstat -n <<non integer value>>


I would like that know what would be the while() command that I have to call getopt() inside the case(), for example, I need all this:


     while ((c = getopt(argc, argv, ":abf:")) != -1) {
         switch(c) {
         case 'a':
              printf("a is set\n");
              break;
         case 'b':
              printf("b is set\n");
              break;
         case 'f':
              filename = optarg;
              printf("filename is %s\n", filename);
              break;
         case ':':
              printf("-%c without filename\n", optopt);
              break;
         case '?':
              printf("unknown arg %c\n", optopt);
              break;
         }
     }


This was I got on a getopt() man page, I understand some basic concept, but I cant put the unaccpted arguments to work. Thanks alot if someone can build this from scratch.

Thanks in advance,

fabio.


