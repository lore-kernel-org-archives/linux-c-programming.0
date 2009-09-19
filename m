From: Manish Katiyar <mkatiyar@gmail.com>
Subject: Re: C program help
Date: Sat, 19 Sep 2009 21:21:54 +0530
Message-ID: <ea11fea30909190851s3f8c5d80ge686092fc0572eae@mail.gmail.com>
References: <25522429.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=xLPGxZeAkkEsQjRwE1sD4XTAvsEZRuAz3UEiKh8C12c=;
        b=TvlrI1M1Tslg/BWjFUHpfLYv4kp/lj5NwiJAmTkweqedCBxQuxB6DMPlnxIllcsUw/
         pZmygzWUM4sdtfe66NmbFflzY+B7d/yR8n0m8PM8mTobXOv7+80tNMKAQVO3V2weB7LL
         AF5MQKTExFEXMQSGeCc9UHmxgwvzrPfWsR5c4=
In-Reply-To: <25522429.post@talk.nabble.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: spiros85 <spirosfr_1985@hotmail.com>
Cc: linux-c-programming@vger.kernel.org

On Sat, Sep 19, 2009 at 8:43 PM, spiros85 <spirosfr_1985@hotmail.com> w=
rote:
>
> Hi guys of dear forum!I am a new programmer in C programming language=
 and i
> have a question for you about the following C code:
> #include <stdio.h>
> #include <stdlib.h>
>
> int main()
> {
> =A0 =A0int x;
> =A0 =A0int answer;
> =A0 =A0int right;
> =A0 =A0int wrong;
> =A0 =A0printf("This is a program of sum\n");
> =A0 =A0right =3D 0; /*Initialization of right value*/
> =A0 =A0wrong =3D 0; /*Initialization of wrong value*/
> =A0 =A0for(x =3D 1; x <=3D 10; x++)[QUOTE][/QUOTE]
> =A0 =A0{
> =A0 =A0 =A0 =A0 =A0printf("What is %d + %d: ", x, x);
> =A0 =A0 =A0 =A0 =A0scanf("%d", &answer);
> =A0 =A0 =A0 =A0 =A0printf("The sum is %d\n", answer);
> =A0 =A0 =A0 =A0 =A0printf("\a");
> =A0 =A0 =A0 =A0 =A0if(answer =3D=3D x + x)
> =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 printf("%d is RIGHT answer\n", answer);
> =A0 =A0 =A0 =A0 =A0 =A0 right++; /*Saves and increases the amount of =
right answers*/
> =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 printf("%d is WRONG answer\n", answer);
> =A0 =A0 =A0 =A0 =A0 =A0 b[10] =3D answer;
> =A0 =A0 =A0 =A0 =A0 =A0 wrong++; /*Saves and increases the amount of =
wrong answers*/
> =A0 =A0 =A0 =A0 =A0 =A0 printf("The correct answer is %d\n", x + x);
> =A0 =A0 =A0 =A0 =A0}
> =A0 =A0}
> =A0 =A0printf("The right answers are %d and the wrong are %d\n", righ=
t, wrong);
> =A0 =A0fflush(stdin);
> =A0 =A0getchar();
> }
>
> First, I use DEV C++ compiler!This program asks from user to find the=
 sum of
> 1+1,2+2 until for loop reaches 10.As you can observe with right++ and
> wrong++ i can define and print to the screen the amount of right or w=
rong
> numbers!
> My question is how could I define the number of correct and wrong num=
bers in
> collaboration with their amount?For example:
> The right answers are 8 and wrong are 2
> The right answers are 2 4 6 8 10 12 14 16
> The wrong answers are 22 44

#include<stdio.h>
#define N 10
int main() {
	int answer;
	int i;
	int result[N][2];
	int right =3D 0, wrong =3D 0;

	for (i=3D1;i<=3DN;i++) {
		printf("What is %i + %i ? :",i,i);
		scanf("%d",&answer);
		if (i+i =3D=3D answer) {
			result[i-1][0] =3D answer;
			result[i-1][1] =3D 1;
			right++;
		} else {
			result[i-1][0] =3D answer;
			result[i-1][1] =3D 0;
			wrong++;
		}
	}

	printf ("The right answers are %d and wrong answers are %d\n",right, w=
rong);
	printf("The right answers are : ");
	for (i=3D0;i<N;i++) {
		if (result[i][1]) {
			printf("%d ", result[i][0]);
		}
	}
	printf("\n");
	printf("The wrong answers are : ");
	for (i=3D0;i<N;i++) {
		if (!result[i][1]) {
			printf("%d ", result[i][0]);
		}
	}
	printf("\n");
	return 0;
}



> --
> View this message in context: http://www.nabble.com/C-program-help-tp=
25522429p25522429.html
> Sent from the linux-c-programming mailing list archive at Nabble.com.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Thanks -
Manish
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
