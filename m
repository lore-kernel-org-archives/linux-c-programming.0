From: ratheesh kannoth <ratheesh.ksz@gmail.com>
Subject: Re: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 11:56:07 +0530
Message-ID: <CAGZFCEGO2JipOu=MeHTjau1ocXa_r483bfL5ViBiXmhAT3m1hw@mail.gmail.com>
References: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
	<CALC0UT=JhhuEc2MNL9_PrhtgkF5eAqNgB8vtQ5ZK09DF8S8edA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=sCwgueCeZw30nQGqnuhGeth6fHwaBOeR7Dp2vFln57Q=;
        b=phIyYPGM9fD1thz+cuoQl0BbRWV0JistNbqARx2qjUThT5XiPdBh1KyUv9lHUOTQZK
         74DFxd+A8915vPR+HEAGIkSgQw7KqhluhYPCy4u4t/W8dvm2KYu1KLSNSxtJTKhOJMUF
         U5Sv/fd7n1vPs8MCQvvsLOG9MpScgKsa9Hup0=
In-Reply-To: <CALC0UT=JhhuEc2MNL9_PrhtgkF5eAqNgB8vtQ5ZK09DF8S8edA@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: =?ISO-2022-JP?B?U3RldmUgR3JhZWdlcnQgKBskQiU5JUYlIyE8JVYbKEIp?= <graegerts@gmail.com>
Cc: linux-c-programming@vger.kernel.org

g++ 2.cpp
2.cpp: In function 'int main()':
2.cpp:21: error: jump to label 'Sri'
2.cpp:13: error:   from here
2.cpp:15: error:   crosses initialization of 'int j'





2011/7/29 Steve Graegert (スティーブ) <graegerts@gmail.com>:
> Is it too much to ask for the actual error returned by the compiler?
>
>
> On Fri, Jul 29, 2011 at 08:01, ratheesh kannoth <ratheesh.ksz@gmail.com> wrote:
>> #include <iostream>
>>
>> using namespace std;
>>
>> int main()
>> {
>>    int i;
>>
>>    cout << "Enter value of i " << endl;
>>    cin >> i;
>>
>>    if (i < 5)
>>        goto Sri;
>>
>>    int j = 6;
>>    cout << "j = " << j << endl;
>>
>>    cout << "Outside Sri" << endl;
>>    return 0;
>>
>> Sri:
>>    cout << "Inside Sri" << endl;
>>    return 0;
>> }
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
