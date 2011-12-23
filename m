From: subin gangadharan <subingangadharan@gmail.com>
Subject: Re: Query: Declaring arrays as extern
Date: Fri, 23 Dec 2011 10:38:29 -0600
Message-ID: <CAKRO8z+-CBpY_bS24UTCFNheOp_QM3fmYPtf_+h=u-xhKeUQcQ@mail.gmail.com>
References: <CAOh2x=ktZBLD2KDOxdBGtz0Acqc0RDkA-VrCCCO2Nby8D=2FRg@mail.gmail.com>
	<CAOh2x=ne21THG6SHrh5RYaryW2Va5JT64BmTvZp9e346rtiM_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=UtuxJIfH5rTp+5V3/afvNrtbxOVxIMsdgr4ywrN0hoo=;
        b=G4j9k0//MhN7xxIvoFPm26tVDqH6VeR8HuEqvPAz7EDZlo2HCs3dGNyeC/R9GTPvfe
         1eJ1+FXBWElN8r9MYgnfjORoFBW00hzG5w57SkZy8ek3TgoRBNs7D1+A9mFatM1W3IPN
         yihn3KmZOsjhOVP6DrJkcrSwYPbVRT+69zAuc=
In-Reply-To: <CAOh2x=ne21THG6SHrh5RYaryW2Va5JT64BmTvZp9e346rtiM_w@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: viresh kumar <viresh.linux@gmail.com>
Cc: linux-c-programming@vger.kernel.org, Shiraz HASHIM <shiraz.hashim@st.com>, "pratyush.anand" <pratyush.anand@st.com>, "vipin.kumar" <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>, Vipul Kumar SAMAR <vipulkumar.samar@st.com>, bhavna.yadav@st.com, Deepak SIKRI <deepak.sikri@st.com>, Armando VISCONTI <armando.visconti@st.com>, Bhupesh SHARMA <bhupesh.sharma@st.com>, rajeev <rajeev-dlh.kumar@st.com>, Amit VIRDI <Amit.VIRDI@st.com>

Hi Viresh,

I think this is what's happening in your case.

Imagine array address is 0x1000 and the contents stored are 1,2,3,4...1=
0.
So when you access  it as a pointer int *array,address of array will
get 0x1000 and array variable will have the
value 1.So when you print it the value will be 1 and when you
dereference it,it will try to fetch from 0x1.

On Thu, Dec 22, 2011 at 3:04 AM, viresh kumar <viresh.linux@gmail.com> =
wrote:
> On Thu, Dec 22, 2011 at 2:34 PM, viresh kumar <viresh.linux@gmail.com=
> wrote:
>> Hi,
>>
>> I can observing an behavior which i am not able to explain.
>
> =A0 I am
>
> sorry. :)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-c-pro=
gramming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
With Regards
Subin Gangadharan

I am not afraid and I am also not afraid of being afraid.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
