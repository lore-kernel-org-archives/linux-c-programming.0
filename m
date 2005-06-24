From: James Colannino <james@colannino.org>
Subject: How to prototype functions that return pointers
Date: Fri, 24 Jun 2005 14:25:35 -0700
Message-ID: <42BC7A4F.60304@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org

Ok, so this is a very embarassing question.  I tried googling for the
answer but haven't figured it out yet, and everything I've tried results
in compilation errors. I want to prototype a function that takes nothing
as an argument but returns a pointer to a character.

I've tried the following:

char * readline();
char *readline();

These first two result in 4 errors, each one identical and each one
telling me "error: two or more data types in declaration of 'readline' "

*char readline();
* char readline();

These second two result in "error: syntax error before 'char' "

I know this should be so simple, but I can't for the life of me figure
this out.  Thanks very much in advance.

James
-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/

" Those who would give up essential Liberty, to purchase a little
temporary Safety, deserve neither Liberty nor Safety." --Benjamin Franklin
