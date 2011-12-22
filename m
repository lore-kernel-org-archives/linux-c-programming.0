From: viresh kumar <viresh.linux@gmail.com>
Subject: Query: Declaring arrays as extern
Date: Thu, 22 Dec 2011 14:34:05 +0530
Message-ID: <CAOh2x=ktZBLD2KDOxdBGtz0Acqc0RDkA-VrCCCO2Nby8D=2FRg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:cc:content-type;
        bh=9UGPZG22dqSm7LO80WLMggSvZMm8EdJ4EpCSVRQKBDE=;
        b=oCI27ArEekUcmOw1OwHRXKGzE3yUqD5yfxEMPsMdT0PtFCfE8YQd3fGNCrWijhCZy1
         RYBr6jwAC/i8vMZ2IYyu31hOZKIyIjhN522NuIL6Cpm8OCHrUqtlYbBcDpt/bLPOWUWu
         1LN9gjDkaMg6Xv6YaMuR2/xoojm1evpa33Ea4=
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org
Cc: Shiraz HASHIM <shiraz.hashim@st.com>, "pratyush.anand" <pratyush.anand@st.com>, "vipin.kumar" <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>, Vipul Kumar SAMAR <vipulkumar.samar@st.com>, bhavna.yadav@st.com, Deepak SIKRI <deepak.sikri@st.com>, Armando VISCONTI <armando.visconti@st.com>, Bhupesh SHARMA <bhupesh.sharma@st.com>, rajeev <rajeev-dlh.kumar@st.com>, Amit VIRDI <Amit.VIRDI@st.com>

Hi,

I can observing an behavior which i am not able to explain.

file1.c

/* global array */
int arr[10];

void main()
{
    printf("addres of array is %p", arr);
}


file2.c
extern int arr[];

void main()
{
    printf("addres of array is %p", arr);
}


file3.c
extern int *arr;


void main()
{
    printf("addres of array is %p", arr);
}




Now, value printed with file 1 and 2 are same, but extern int *arr
doesn't work at all. The address shown is just something else.

I know we pass array addresses to routines this way only, but with
extern it is just not working.

Can somebody please explain it?

--
viresh
