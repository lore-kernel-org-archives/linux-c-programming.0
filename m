From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: value computed is not used ??
Date: Tue, 1 Jun 2004 13:34:51 -0400
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <E3E30069B061524E90BCEE4417E30661138500@monm207.monmouth.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org



-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org
[mailto:linux-c-programming-owner@vger.kernel.org]On Behalf Of Charlie
Gordon
Sent: Tuesday, June 01, 2004 12:09 PM
To: linux-c-programming@vger.kernel.org
Subject: Re: value computed is not used ??

Charlie wrote (qoting J.)

>> I understood everything in the above answer except for one issue ? Why
is:
>> int main(void) {
>> The wrong prototype for main ? main() schould return `0' or `1' etc ?!?
>> Thank you very much for taking the effort to explain and answer.
>> Jeroen.

>the proper prototype for main is
>int main(int argc, char **argv);
>or possibly :
>int main(int argc, char *argv[]);
>which is semantically equivalent, but emphasises the fact that argv points
>to an array of char*

I to am a little confused on why you state that int main(void) is an
incorrect 
prototype for main?  Quoting from the C99 - draft standard,

"The function called at program startup is named main.  The implementation
declares
no prototype for this function.  It shall be defined with a return type of
int and with
no parameters:
    int main(void) {/* ... */}
or with two parameters (referred to hear as argc and argv, though any names
may be used, 
as they are local to the function in which they are declared):
    int main(int argc, char* argv[]) {/* ... *.}
or equivalent, or in some other implementation-defined manner." (section
5.1.2.2.1)

This seems to imply that either prototype for main may be used.  Is this a
new 
addition to the C99 standard, or am I missing something here.

George





-
To unsubscribe from this list: send the line "unsubscribe
linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
