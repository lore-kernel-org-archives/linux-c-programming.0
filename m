From: Darren Sessions <dsessions@ionosphere.net>
Subject: Newbie - Perl Equivalent Split - Seg Faults
Date: Mon, 13 Dec 2004 11:56:25 -0500
Message-ID: <BDE333E9.1622%dsessions@ionosphere.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Here is a super simple program that (trys) to split a charvar based on a
delimiter. I get no compile errors. If I remove the strtok line, then
split_var returns the string passed to it from main just fine.

I tried changing the char *delim from *delim to delim[50] - same problem.

This is something stupid, and probably super simple. Coming from the Perl
world, I'm trying to write some equivalent string manipulation functions
that I can use throughout my programs to avoid repetition and make the code
cleaner and easier to read.

Thanks in advance,

 - Darren




#include <stdio.h>
#include <string.h>

char *split_char(char *string, char *delim) {
  fprintf( stderr, "\tString = %s \n", string);
  fprintf( stderr, "\tDelimiter = %s \n", delim);
  string = strtok(string, delim);
  return string;
}

int main()
{
  char *testvar;
  testvar = split_char("test-hello", "-");
  fprintf( stderr, "\tArray = %s \n", testvar);
  return(0);
}












