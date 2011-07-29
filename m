From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 12:14:43 +0530
Message-ID: <4E3256DB.50308@linux.vnet.ibm.com>
References: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com> <CALC0UT=JhhuEc2MNL9_PrhtgkF5eAqNgB8vtQ5ZK09DF8S8edA@mail.gmail.com> <CAGZFCEGO2JipOu=MeHTjau1ocXa_r483bfL5ViBiXmhAT3m1hw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEGO2JipOu=MeHTjau1ocXa_r483bfL5ViBiXmhAT3m1hw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: =?ISO-2022-JP?B?IlN0ZXZlIEdyYWVnZXJ0ICgbJEIlOSVGJSMhPCVWGyhCKSI=?= <graegerts@gmail.com>, linux-c-programming@vger.kernel.org

On 07/29/2011 11:56 AM, ratheesh kannoth wrote:
> #include<iostream>
>>>
>>>  using namespace std;
>>>
>>>  int main()
>>>  {
>>>      int i;
>>>
>>>      cout<<  "Enter value of i "<<  endl;
>>>      cin>>  i;
>>>
>>>      if (i<  5)
>>>          goto Sri;
>>>
>>>      int j = 6;

Changing it to two lines will make it work:
int j;
j = 6;

Regards,
Seenu.

>>>      cout<<  "j = "<<  j<<  endl;
>>>
>>>      cout<<  "Outside Sri"<<  endl;
>>>      return 0;
>>>
>>>  Sri:
>>>      cout<<  "Inside Sri"<<  endl;
>>>      return 0;
>>>  }

