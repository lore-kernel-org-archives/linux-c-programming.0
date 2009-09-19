From: spiros85 <spirosfr_1985@hotmail.com>
Subject: C program help
Date: Sat, 19 Sep 2009 08:13:22 -0700 (PDT)
Message-ID: <25522429.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming@vger.kernel.org


Hi guys of dear forum!I am a new programmer in C programming language and i
have a question for you about the following C code:
#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x;
    int answer;
    int right;
    int wrong;
    printf("This is a program of sum\n");
    right = 0; /*Initialization of right value*/
    wrong = 0; /*Initialization of wrong value*/
    for(x = 1; x <= 10; x++)[QUOTE][/QUOTE]
    {
          printf("What is %d + %d: ", x, x);
          scanf("%d", &answer);
          printf("The sum is %d\n", answer);
          printf("\a");
          if(answer == x + x)
          {
             printf("%d is RIGHT answer\n", answer);
             right++; /*Saves and increases the amount of right answers*/
          }
          else
          {
             printf("%d is WRONG answer\n", answer);
             b[10] = answer;
             wrong++; /*Saves and increases the amount of wrong answers*/
             printf("The correct answer is %d\n", x + x);
          }
    }
    printf("The right answers are %d and the wrong are %d\n", right, wrong);
    fflush(stdin);
    getchar();
}
 
First, I use DEV C++ compiler!This program asks from user to find the sum of
1+1,2+2 until for loop reaches 10.As you can observe with right++ and
wrong++ i can define and print to the screen the amount of right or wrong
numbers!
My question is how could I define the number of correct and wrong numbers in
collaboration with their amount?For example:
The right answers are 8 and wrong are 2
The right answers are 2 4 6 8 10 12 14 16
The wrong answers are 22 44
-- 
View this message in context: http://www.nabble.com/C-program-help-tp25522429p25522429.html
Sent from the linux-c-programming mailing list archive at Nabble.com.

