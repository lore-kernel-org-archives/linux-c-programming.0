From: vipul kumar samar <vipulkumar.samar@st.com>
Subject: Re: c++ code - not getting compiled !!!!!!!!!
Date: Fri, 29 Jul 2011 12:21:54 +0530
Message-ID: <4E32588A.5060406@st.com>
References: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAGZFCEFvwrbscViED2ZEC3Yh9p4EstTLkxxfQD8FJZS03OpsLw@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ratheesh kannoth <ratheesh.ksz@gmail.com>
Cc: "linux-c-programming@vger.kernel.org" <linux-c-programming@vger.kernel.org>

On 07/29/2011 11:31 AM, ratheesh kannoth wrote:
> #include<iostream>
>
> using namespace std;
>
> int main()
> {
>      int i;
>
>      cout<<  "Enter value of i "<<  endl;
>      cin>>  i;
>
>      if (i<  5)
>          goto Sri;
>
>      int j = 6;
  replace int j = 6;
with
	int j;
	j = 6;
  C++ standard: not able to bypasses declaration with initialization.

Regards
Vipul Samar
>      cout<<  "j = "<<  j<<  endl;
>
>      cout<<  "Outside Sri"<<  endl;
>      return 0;
>
> Sri:
>      cout<<  "Inside Sri"<<  endl;
>      return 0;
> }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
I want another RE-WRITE on my CEASAR SALAD!!
