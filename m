From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: feof fails
Date: Wed, 15 Sep 2004 10:57:32 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E3066113852C@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Christian wrote:

>I have a simple problem. I opened a file with fopen and read from the file 
>with:
>  while ( !feof( infile ) )
> {
>   fgets( buffer, BUFFER_SIZE, infile );
>   new_number = atoi ( buffer );
>.....

>The file is filled withe a stack of numbers, 7 charakters and each is 
>terminated by an '\n'. 

>My problem now is, that the last number is been read twice. What is the 
>problem?

The problem is not with feof, but rather how input works (this issue plagued
me for a number of years).  Lets assume that the last line of your file is
(where
^ represents the new-line `character', and the arrow is the current file
pointer):

    1234567^
   ^
   |

Now, when fgets process this line, it reads up to and including the the new
line
character, moving the file pointer thus:

    1234567^
            ^
            |

At this point, we have not hit the EOF `character' as it is the next
`character' to
be read in.  So we will go through the loop one more time.  This time the
call to 
fgets will fail due to hitting the end-of-file as the first character (and
thus not 
placing anything in the output buffer).  The contents the buffer are left
unmodified 
and will be processed by the remainder of the loop body.  Now the next time
through 
the loop, feof will return true and the loop will be exited - thus the
problem of 
reading the last line twice.  You can see this behaviour in the following
code 
snippet:

while(!feof(fp))
{
    //memset((void*)buffer, '\0', BUFFER_SIZE);
    fgets(buffer, BUFFER_SIZE, fp);
    buffer[strlen(buffer)-1] = '\0';              // eat new line
    printf("***%s***",buffer);
}

Now if the input file contains the lines (where ^ represents a new line):

123456^
234567^
345678^

The output is:

***123456***
***234567***
***345678***
***34567***

(the last line is truncated due to the logic to eat the new line, the
contencts 
 of buffer is shortened by one twice).

If the memset line is uncomment, the output is:

***123456***
***234567***
***345678***
******

We have not gained much, at least the last line will not be reprocessed
since we 
clear the buffer prior to each read.  But it does not really solve your
problem 
(yet).  The hint, is to look at the return value of fgets which is either
the 
buffer or NULL on error of if EOF is encountered.  With this, we can change
the 
logic of the above loop to:

while(!feof(fp))
{
    memset((void*)buffer, '\0', BUFFER_SIZE);
    if(NULL == fgets(buffer, BUFFER_SIZE, fp))
    {
	if(ferror(fp))
      {
	   fprintf(stderr, "fgets failed.");
      }

      break;
    }
    else
    {
       int nLen = strlen(buffer) - 1;
       if(buffer[nLen] == '\n') buffer[nLen] = '\0';
       printf("***%s***",buffer);
    }
}

Using the above code, the output is:

***123456***
***234567***
***345678***

Also, with the change in logic of handling new-lines, we can now handle
files of 
the sort:

123456^
234567^
345678

i.e. - files that do not end with a new line.  

Hope this helps,

George
