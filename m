From: Alok Singhal <as8ca@virginia.edu>
Subject: Re: Query: Declaring arrays as extern
Date: Fri, 23 Dec 2011 10:27:15 -0800
Message-ID: <CAAjkWR06JQ5AxVmgKnF+AEFiCw-yOxyX22Syf88ywG1Z3Nvg1g@mail.gmail.com>
References: <CAOh2x=ktZBLD2KDOxdBGtz0Acqc0RDkA-VrCCCO2Nby8D=2FRg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=ktZBLD2KDOxdBGtz0Acqc0RDkA-VrCCCO2Nby8D=2FRg@mail.gmail.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: viresh kumar <viresh.linux@gmail.com>
Cc: linux-c-programming@vger.kernel.org, Shiraz HASHIM <shiraz.hashim@st.com>, "pratyush.anand" <pratyush.anand@st.com>, "vipin.kumar" <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>, Vipul Kumar SAMAR <vipulkumar.samar@st.com>, bhavna.yadav@st.com, Deepak SIKRI <deepak.sikri@st.com>, Armando VISCONTI <armando.visconti@st.com>, Bhupesh SHARMA <bhupesh.sharma@st.com>, rajeev <rajeev-dlh.kumar@st.com>, Amit VIRDI <Amit.VIRDI@st.com>

On Thu, Dec 22, 2011 at 1:04 AM, viresh kumar <viresh.linux@gmail.com> =
wrote:
> Hi,
>
> file1.c
>
> /* global array */
> int arr[10];
>
> void main()
> {
> =A0 =A0printf("addres of array is %p", arr);
> }
>
>
> file2.c
> extern int arr[];
>
> void main()
> {
> =A0 =A0printf("addres of array is %p", arr);
> }
>
>
> file3.c
> extern int *arr;
>
> void main()
> {
> =A0 =A0printf("addres of array is %p", arr);
> }
>
>
> Now, value printed with file 1 and 2 are same, but extern int *arr
> doesn't work at all. The address shown is just something else.

Presumably you are compiling file1.c without the definition of "main"
in when you compile file2.c and file3.c with it, and with the
definition of main when you are compiling file1.c as a standalone
unit.

This is happening because an array is not a pointer.  In fact, your
question is so frequently asked, that it is on comp.lang.c FAQ list:

http://c-faq.com/aryptr/aryptr1.html

You might also want to read all the questions and answers in
http://c-faq.com/aryptr/index.html.

> I know we pass array addresses to routines this way only, but with
> extern it is just not working.

When you pass an array to a function, the array name is converted to a
pointer to its first element.  But that is not what is happening in
your code above: "extern int *arr;" is not the right declaration for
'arr'.

Also, you should be saying int main(void) instead of void main().
--
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
