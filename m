From: Krishna Mohan <gkmohan@rocsys.com>
Subject: scanf with pointers as arguments
Date: 17 Nov 2004 11:20:15 +0530
Message-ID: <1100670616.1157.15.camel@KrishnaMohan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux c programming list <linux-c-programming@vger.kernel.org>

Hi
Can anybody plz tell me what's wrong with this code!
I am getting SEGMENTATION FAULT. ofcourse, if i use &i, &s as arguments
in scanf, it's work fine as usual. can't i use pointers which hold the
address of i and s. plz clarify this. THANKS IN ADVANCE.

	int i,*iptr = &i;
        short s,*shptr = &s;
        printf("enter 2 values:\n");
        scanf("%d %d",iptr,shptr);
        printf("%d %d\n",*iptr,*shptr);
	printf("%d %d\n",i,s);



