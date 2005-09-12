From: _z33 <timid.Gentoo@gmail.com>
Subject: Re: Confusing Prototype
Date: Mon, 12 Sep 2005 18:00:22 +0530
Message-ID: <dg3sd3$cd7$1@sea.gmane.org>
References: <432470B7.7050609@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <432470B7.7050609@colannino.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

James Colannino wrote:
> Hey everyone.  I was looking at the prototype for fgets and noticed the 
> following:
> 
> char *fgets(char *s, int size, FILE *stream);
> 
> I'm confused because it says that it returns a pointer to a character, 
> but at the same time it stores a string at the address pointed to by 
> char *s, so why does it also need to return a pointer?  I'm confused.  

   please correct me if I'm wrong. As far as I know, you need a 
mechanism to find out if fgets, executed perfectly or not, and that's 
the primary reason it returns a value. When fgets fails to read from the 
stream specified it returns a null pointer to indicate the error. The 
string in the argument list of the function however, will have the value 
till which execution proceeded without error. (hope I'm right about this)

   If in case the returning pointer, was avoided, then the error 
couldn't be properly indicated. And the only way will be to modify the 
input string container itself. This could create an ambiguity, if the 
input file or stream had nothing but a null value. The programmer might 
not be able to differentiate whether an error occured or whether input 
was null.

#include <stdio.h>

int main (int argc, char *argv[])
{
     /* for file access */
     FILE *fp;

     /* array to store some 5 characters */
     char array[5] = {'\0'};

     /* to store the return value */
     char *status;

     /* open the file for reading */
     if ((fp = fopen ("testFile.txt", "r")) == NULL)
     {
         /* display error information and exit */
         fprintf (stderr, "Error: file read failed. \n");
         exit (1);
     }

     /* read twice */
     status = fgets (array, sizeof (array), fp);
     status = fgets (array, sizeof (array), fp);

     /*
      * without the return value fgets can't display the error
      * encountered.
      * the input string passed is never touched when an error occurs.
      */

     /* close file */
     fclose (fp);

     /* display the array value */
     printf ("array: %s \n", array);

     /* display the status returned */
     printf ("status: %s \n", status);

     return (0);
}

Sorry, if I have confused you.

_z33
-- 
I love TUX; well... that's an understatement :)

