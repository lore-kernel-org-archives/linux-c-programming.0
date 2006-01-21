From: James Colannino <james@colannino.org>
Subject: Code critique: checking for syntax errors
Date: Sat, 21 Jan 2006 11:10:04 -0800
Message-ID: <43D2870C.3030505@colannino.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hey everyone.  I was wondering if anybody here had the time to glance at 
my code here and tell me what they think of it, good or bad.  I am 
worried that my style is not very good, and I'd really like to improve.  
I'm working with the Kernigan and Ritchie Book, "C Programming, 2nd 
Edition."  This is the 1-24 exercise, which asks the programmer to write 
a program that checks C source for rudimentary syntax errors.  I check 
for unbalanced parenthesis, brackets, braces, double/single quotes (I 
properly consider escape characters - I hope :-P) and unterminated 
comments.  I've run this on multiple C source files, and all of them 
(after having tested them with the compiler first) check out as they 
should.  I've done a little testing to make sure it properly recognizes 
unbalanced stuff, but my testing in that area by comparison has been a 
bit weak.

Note that the book doesn't go into working with whole strings at once 
yet (this is only chapter 1), so that's why I'm using fgetc() for every 
individual character in the file.

Thank you everyone for any input you can provide :)

James

/* 1-24-syntax.c - checks C source code for rudimentary syntax
   errors such as unbalanced parenthesis, brackets, quotes, etc. */


#include <stdio.h>
#include <stdlib.h>


/* Each of the below functions returns 0 on success and -1 on syntax 
error */
int check_brackets(FILE *input);
int check_braces(FILE*INPUT);
int check_parenthesis(FILE *input);
int check_doublequotes(FILE *input);
int check_singlequotes(FILE *input);
int check_comments(FILE *input);

/* keeps track of the current line number */
int ln = 1;


int main (int argc, char *argv[]) {

   FILE *input;

   if (argc > 2) {
      fprintf(stderr, "error: too many arguments\n");
      exit(1);
   }

   if (argc < 2) input = stdin;
   else {
      if ((input = fopen(argv[1], "ra")) == NULL) {
         fprintf(stderr, "error: could not open %s", argv[1]);
         exit(1);
      }
   }

   int character;

   while ((character = fgetc(input)) != EOF) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case '{':
            if (check_brackets(input) == -1) exit(1);
            break;
         case '[':
            if (check_braces(input) == -1) exit(1);
            break;
         case '(':
            if (check_parenthesis(input) == -1) exit(1);
            break;
         case '\"':
            if (check_doublequotes(input) == -1) exit(1);
            break;
         case '\'':
            if (check_singlequotes(input) == -1) exit(1);
            break;
         case ']':
            fprintf(stderr, "error: line %d: unbalanced ']'\n", ln);
            exit(1);
         case ')':
            fprintf(stderr, "error: line %d: unbalanaced ')'\n", ln);
            exit(1);
         case '}':
            fprintf(stderr, "error: line %d: unbalanaced '}'\n", ln);
            exit(1);
         default:
            break;
      }

         if (character == '/') {
            if ((character = fgetc(input)) == '*') {
               if (check_comments(input) == -1) exit(1);
            }

            else {
               if (ungetc(character, input) == NULL) {
                  fprintf(stderr, "error: could not ungetc\n");
                  exit(1);
               }
            }
         }
   }

   printf("Done!\n");
   return 0;
}


int check_brackets(FILE *input) {

   #ifdef DEBUG
   printf("check_brackets()\n");
   #endif

   int character;

   while ((character = fgetc(input)) != EOF) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case '}':
            return 0;
         case '{':
            if (check_brackets(input) == -1) return -1;
            break;
         case '[':
            if (check_braces(input) == -1) return -1;
            break;
         case '(':
            if (check_parenthesis(input) == -1) return -1;
            break;
         case '\"':
            if (check_doublequotes(input) == -1) return -1;
            break;
         case '\'':
            if (check_singlequotes(input) == -1) return -1;
            break;
         case ']':
            fprintf(stderr, "error: line %d: unbalanced ']'\n", ln);
            return -1;
         case ')':
            fprintf(stderr, "error: line %d: unbalanaced ')'\n", ln);
            return -1;
         default:
            break;
      }

      if (character == '/') {
         if ((character = fgetc(input)) == '*') {
            if (check_comments(input) == -1) return -1;
         }

         else {
            if (ungetc(character, input) == NULL) {
               fprintf(stderr, "error: could not ungetc\n");
               return -1;
            }
         }
      }
   }

   fprintf(stderr, "error: line %d: unbalanced '{'\n", ln);
   return -1;
}


int check_braces(FILE *input) {

   #ifdef DEBUG
   printf("check_braces()\n");
   #endif

   int character;

   while ((character = fgetc(input)) != EOF) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case ']':
            return 0;
         case '{':
            if (check_brackets(input) == -1) return -1;
            break;
         case '[':
            if (check_braces(input) == -1) return -1;
            break;
         case '(':
            if (check_parenthesis(input) == -1) return -1;
            break;
         case '\"':
            if (check_doublequotes(input) == -1) return -1;
            break;
         case '\'':
            if (check_singlequotes(input) == -1) return -1;
            break;
         case '}':
            fprintf(stderr, "error: line %d: unbalanced ']'\n", ln);
            return -1;
         case ')':
            fprintf(stderr, "error: line %d: unbalanaced ')'\n", ln);
            return -1;
         default:
            break;
      }

      if (character == '/') {
         if ((character = fgetc(input)) == '*') {
            if (check_comments(input) == -1) return -1;
         }

         else {
            if (ungetc(character, input) == NULL) {
               fprintf(stderr, "error: could not ungetc\n");
               return -1;
            }
         }
      }
   }

   fprintf(stderr, "error: line %d: unbalanced '['\n", ln);
   return -1;
}


int check_parenthesis(FILE *input) {

   #ifdef DEBUG
   printf("check_parenthesis()\n");
   #endif

   int character;

   while ((character = fgetc(input)) != EOF) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case ')':
            return 0;
         case '{':
            if (check_brackets(input) == -1) return -1;
            break;
         case '[':
            if (check_braces(input) == -1) return -1;
            break;
         case '(':
            if (check_parenthesis(input) == -1) return -1;
            break;
         case '\"':
            if (check_doublequotes(input) == -1) return -1;
            break;
         case '\'':
            if (check_singlequotes(input) == -1) return -1;
            break;
         case ']':
            fprintf(stderr, "error: line %d: unbalanced ']'\n", ln);
            return -1;
         case '}':
            fprintf(stderr, "error: line %d: unbalanaced ')'\n", ln);
            return -1;
         default:
            break;
      }

      if (character == '/') {
         if ((character = fgetc(input)) == '*') {
            if (check_comments(input) == -1) return -1;
         }

         else {
            if (ungetc(character, input) == NULL) {
               fprintf(stderr, "error: could not ungetc\n");
               return -1;
            }
         }
      }
   }

   fprintf(stderr, "error: line %d: unbalanced '('\n", ln);
   return -1;
}


int check_doublequotes(FILE *input) {

   #ifdef DEBUG
   printf("check_doublequotes()\n");
   #endif

   int character;

   while ((character = fgetc(input)) != EOF) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case '\"':
            return 0;
         default:
            break;
      }
   }

   fprintf(stderr, "error: line %d: unbalanced double quotes\n", ln);
   return -1;
}


int check_singlequotes(FILE *input) {

   #ifdef DEBUG
   printf("check_singlequotes()\n");
   #endif

   int character;

   for (int count = 0; (character = fgetc(input)) != EOF; count++) {
      switch(character) {
         case '\n':
            ln++;
            break;
         case '\\':
            character = fgetc(input);
            if      (character == 'a') continue;
            else if (character == 'b') continue;
            else if (character == 't') continue;
            else if (character == 'n') continue;
            else if (character == 'v') continue;
            else if (character == 'f') continue;
            else if (character == 'r') continue;
            else if (character == '\"') continue;
            else if (character == '\'') continue;
            else if (character == '\?') continue;
            else if (character == '\\') continue;
            else {
               if (ungetc(character, input) == NULL) {
                  fprintf(stderr, "error: could not ungetc\n");
                  return -1;
               }
            }

            break;
         case '\'':
            if (count < 1) {
               fprintf(stderr, "error: line %d: too \
few characters between ''\n", ln);
               return -1;
            }

            else return 0;
         default:
            break;
      }
   }

   fprintf(stderr, "error: line %d: unbalanced single quotes\n", ln);
   return -1;
}


int check_comments(FILE *input) {

   #ifdef DEBUG
   printf("check_comments()\n");
   #endif

   int character;

   while ((character = fgetc(input)) != EOF) {
      if (character == '*') {
         if ((character = fgetc(input)) == '/') return 0;
         else {
            if (ungetc(character, input) == NULL) {
               fprintf(stderr, "error: could not ungetc\n");
               return -1;
            }
         }
      }
   }

   fprintf(stderr, "error: line %d: unterminated comment\n", ln);
   return -1;
}

-- 
My blog: http://www.crazydrclaw.com/
My homepage: http://james.colannino.org/


