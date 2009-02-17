From: Fundu <fundu_1999@yahoo.com>
Subject: strtok, bus error
Date: Mon, 16 Feb 2009 18:52:23 -0800 (PST)
Message-ID: <125035.76273.qm@web63404.mail.re1.yahoo.com>
Reply-To: fundu_1999@yahoo.com
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

i'm trying to do pretty simple replacement using strtok.
but it looks like i have missed some subtle difference between the two following 
  
  char src[]  = "hello world #";
  char *other = "hello world #";

because if i use "char * other" with strtok it fails with bus error but i use src it works, don't understand what's the difference.

here's the code for strtok.
     char delims[] = "#";
     char *result = NULL;
     // this works 
     result = strtok( src, delims );
     // this doesnot work and give a bus error
     // result = strtok(other, delims);
     while( result != NULL ) {
         printf( "result is \"%s\"\n", result );
         result = strtok( NULL, delims );
     }

what am i missing here ? i thought both way of declaration(mentioned above ) were the same apparently the r not, whats the diff ?

any insight would be appreciated, TIA!


      
