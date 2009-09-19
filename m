From: Tim Walberg <twalberg@comcast.net>
Subject: Re: C program help
Date: Sat, 19 Sep 2009 10:38:20 -0500
Message-ID: <20090919153820.GC947@comcast.net>
References: <25522429.post@talk.nabble.com>
Reply-To: Tim Walberg <twalberg@comcast.net>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <25522429.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: spiros85 <spirosfr_1985@hotmail.com>
Cc: linux-c-programming@vger.kernel.org

Not tested, but here's a simple (not very efficient or elegant, but
reasonable) concept. It's basically keeping a history, and postprocessing
the history to generate the lists. It might be better to keep separate
right/wrong lists as you go, but it's not as simple...


#include <stdio.h>
#include <stdlib.h>
#define NPROBLEMS 10

int main()
{ int x[NPROBLEMS], y[NPROBLEMS], right_answer[NPROBLEMS], given_answer[NPROBLEMS];
  int nright, nwrong;
  int i;

  for (i = 0; i < NPROBLEMS; ++i)
  { x[i] = i;
    y[i] = i;
    right_answer[i] = x[i] + y[i];
    printf("What is %d + %d? ", x[i], y[i]);
    scanf("%d", &(given_answer[i]));

    if (given_answer[i] == right_answer[i])
    { printf("%d is RIGHT answer\n", given_answer[i]);
      ++nright;
    }
    else
    { printf("%d is WRONG answer; the RIGHT answer is %d\n", given_answer[i], right_answer[i]);
      ++nwrong;
    }
  }

  printf("You got %d right and %d wrong\n", nright, nwrong);

  printf("Right answers:");
  for (i = 0; i < NPROBLEMS; ++i)
    if (right_answer[i] == given_answer[i])
      printf(" %d", given_answer[i]);
  printf("\n");

  printf("Wrong answers:");
  for (i = 0; i < NPROBLEMS; ++i)
    if (right_answer[i] != given_answer[i])
      printf(" %d", given_answer[i]);
  printf("\n");

  return 0;
}

  
On 09/19/2009 08:13 -0700, spiros85 wrote:
>>	
>>	Hi guys of dear forum!I am a new programmer in C programming language and i
>>	have a question for you about the following C code:
>>	#include <stdio.h>
>>	#include <stdlib.h>
>>	
>>	int main()
>>	{
>>	    int x;
>>	    int answer;
>>	    int right;
>>	    int wrong;
>>	    printf("This is a program of sum\n");
>>	    right = 0; /*Initialization of right value*/
>>	    wrong = 0; /*Initialization of wrong value*/
>>	    for(x = 1; x <= 10; x++)[QUOTE][/QUOTE]
>>	    {
>>	          printf("What is %d + %d: ", x, x);
>>	          scanf("%d", &answer);
>>	          printf("The sum is %d\n", answer);
>>	          printf("\a");
>>	          if(answer == x + x)
>>	          {
>>	             printf("%d is RIGHT answer\n", answer);
>>	             right++; /*Saves and increases the amount of right answers*/
>>	          }
>>	          else
>>	          {
>>	             printf("%d is WRONG answer\n", answer);
>>	             b[10] = answer;
>>	             wrong++; /*Saves and increases the amount of wrong answers*/
>>	             printf("The correct answer is %d\n", x + x);
>>	          }
>>	    }
>>	    printf("The right answers are %d and the wrong are %d\n", right, wrong);
>>	    fflush(stdin);
>>	    getchar();
>>	}
>>	 
>>	First, I use DEV C++ compiler!This program asks from user to find the sum of
>>	1+1,2+2 until for loop reaches 10.As you can observe with right++ and
>>	wrong++ i can define and print to the screen the amount of right or wrong
>>	numbers!
>>	My question is how could I define the number of correct and wrong numbers in
>>	collaboration with their amount?For example:
>>	The right answers are 8 and wrong are 2
>>	The right answers are 2 4 6 8 10 12 14 16
>>	The wrong answers are 22 44
>>	-- 
>>	View this message in context: http://www.nabble.com/C-program-help-tp25522429p25522429.html
>>	Sent from the linux-c-programming mailing list archive at Nabble.com.
>>	
>>	--
>>	To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>>	the body of a message to majordomo@vger.kernel.org
>>	More majordomo info at  http://vger.kernel.org/majordomo-info.html
End of included message



-- 
twalberg@comcast.net
