From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Newbie - Perl Equivalent Split - Seg Faults
Date: Mon, 13 Dec 2004 16:33:39 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3621@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Darren wrote:

>Oh.. I almost forgot, if I place the strtok in main instead of calling it as
>a function in split_char - it works.

> Here is a super simple program that (trys) to split a charvar based on a
> delimiter. I get no compile errors. If I remove the strtok line, then
> split_var returns the string passed to it from main just fine.
> 
> I tried changing the char *delim from *delim to delim[50] - same problem.
> 
> This is something stupid, and probably super simple. Coming from the Perl
> world, I'm trying to write some equivalent string manipulation functions
> that I can use throughout my programs to avoid repetition and make the code
> cleaner and easier to read.
> 
> #include <stdio.h>
> #include <string.h>
> 
> char *split_char(char *string, char *delim) {
>   fprintf( stderr, "\tString = %s \n", string);
>   fprintf( stderr, "\tDelimiter = %s \n", delim);
>   string = strtok(string, delim);
>   return string;
> }
> 
> int main()
> {
>   char *testvar;
>   testvar = split_char("test-hello", "-");
>   fprintf( stderr, "\tArray = %s \n", testvar);
>   return(0);
> }
> 

First of all, this is not a silly question.  You are going to find that string processing
in C is very painfull when compared to PERL.  After all PERL as initially designed as 
a text processing language, C was designed as a general purpose language.

You probably want to take a look at how strtok works.  It is a `destructive' function
call in that it actually modifies the string that is being tokenized.  

As an example, consider tokenizing the string `test-case-hello'.  After the first
call to strtok (i.e. strtok(string, delim), with string containing "test-case-hello" 
and delim containing "-") we have the following situation.  strtok has replaced the 
first occurance of the deliminator with a null ('\0') character, returns a pointer to the 
first token and moves it internal pointer to the character after the old deliminator.

  return value
  |        internal pointer
  |        |
  \/       \/
  t e s t\0case-hello\0

on the next call to strtok (i.e. strtok(NULL, delim) -- not the value of the first 
parameter.  NULL is used to signify that we are continuing to tokenize the first string),
we start from the internal pointer and search forward to find the next deliminator.  Now
this is replaced with a null and the address of the token is returned and the internal 
pointer is moved to the first character after the old deliminator.  This process continues
until no more delimitors are found and then strtok returns null.

At this point, the original string now looks like this:

  t e s t\0c a s e\0h e l l o\0

When I need to split a line using strtok I typically do something like this.  Note, I 
have not attempted to compile this, it should work (barring typos) - but no guarentees.

char* string="test-case-hello"
char* delim="-"
int   idx = 0;

    these creates my sting and delimators and an index value

char* tokens[MAX_TOKENS];

    this creates an array of pointers to characters.  In production code you would need
    to use some sort of dynamic data structure since you could not know the number of 
    tokens in a line in advance

char*  token;
    
    this is a pointer to a character (which in C can also be a pointer to a string).

for(idx = 0; idx < MAX_TOKENS; idx++)
    tokens[idx] = NULL;

    this is used to initialize each pointer in the array to NULL.

token = strtok(string, delim);
idx = 0;

    perform the first tokenization and reset the index value.

while((idx < MAX_TOKENS) && (token != NULL) 
{
    tokens[idx] = token;   
    idx++;
    strtok(NULL, delim);
}

   this loops through the string, pulling out each token or until the max number of 
   tokens has been found (do not want to overflow a buffer now do we?).  Now at 
   this point the array `tokens' contains the various tokens.

idx = 0;
while((idx < MAX_TOKENS) && (tokens[idx] != 0)
{
    printf("%s ", tokens[nIdx]);
    idx++;
}

printf("\n");

    this loops through the array, stopping when index reaches MAX_TOKEN of a token
    is NULL, printing each token in turn.

So now armed with this to write an equivalent `split' function in C you need to create 
a function that takes a string (or a character array in C-speak) and another string as 
arguments and returns an array of pointers to string.  A first pass might be:

char** split(char* string, char* delim)
{
   char** tokens = malloc(sizeof(char*) * MAX_TOKENS);
   char*  working = malloc((strlen(string) + 1) * sizeof(char));
   char*  token;  
   int    idx;

   /* insure that malloc worked.... */
   if((NULL != working) && (NULL != tokens))
   {   
       strcpy(working, string);        /* make a working copy of the string */

       for(idx = 0; idx < MAX_TOKENS; idx++)
          tokens[idx] = NULL;

       token = strtok(working, delim);
       idx = 0;

       while((idx < MAX_TOKENS) && (token != NULL) 
       {
            tokens[idx] = malloc(sizeof(char) * strlen(token);
            strcpy(tokens[idx], token);  
            idx++;
            token = strtok(NULL, delim);
       }

       free(working);
   }

   return tokens;
}

You would use this function like,

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char** split(char*, char*);

int main(int argc, char** argv)
{
    char*   text="this-is-a-testing";
    char*   delim="-";
    char**  tokens;
    int     i = 0;

    tokens = split(text,delim);

    while(NULL != tokens[i])
    {
         printf("token %d is %s\n", i, tokens[i]);
         i++;
    }

    /* NOTE : missing clean up of tokens.  This program leaks 
              memory like a sieve */

    return 0;
}

The program can be compiled as (assuming everything is in a file called split.c):

gcc -ansi -pedantic -Wall split.c -o my_split

and produces the following output:

token 0 is this
token 1 is is
token 2 is a
token 3 is testing

Hope this helps and happy coding,
George




