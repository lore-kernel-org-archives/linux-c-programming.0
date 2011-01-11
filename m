From: Amit Virdi <amit.virdi@st.com>
Subject: Re: float
Date: Tue, 11 Jan 2011 13:26:47 +0530
Message-ID: <4D2C0D3F.70008@st.com>
References: <AANLkTikyOX3yeh4Xo5vrax651djd_rkQuPy_vm30AZhM@mail.gmail.com> <4D2C0AC0.2000200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <4D2C0AC0.2000200@gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Weber <thomas.weber.linux@googlemail.com>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

In floating point comparisons, test for range rather testing for equality. Something like:

 int compare_float(float f1, float f2)
 {
  float precision = 0.00001;
  if (((f1 - precision) < f2) && 
      ((f1 + precision) > f2))
   {
    return 1;
   }
  else
   {
    return 0;
   }
 }

This is because, floating point numbers are stored in binary format and rounds off in strange ways.

On 01/11/2011 01:16 PM, Thomas Weber wrote:
> Am 11.01.2011 08:38, schrieb ratheesh k:
>> I could not understand  why it getting printed like this. Could any
>> body tell me.
>>
>> #include <stdio.h>
>>
>> int main()
>> {
>>         float f=0.0f;
>>         int i;
>>
>>         for(i=0;i<10;i++)
> missing braces here?
>>                 f = f + 0.1f;
>>
>>         if(f == 1.0f)
>>                 printf("f is 1.0 \n");
>>         else
>>                 printf("f is NOT 1.0\n");
>>
>>         return 0;
>> }
>> --
> 
> 
> Thomas
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
~Amit Virdi
