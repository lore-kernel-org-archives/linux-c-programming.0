From: "Anil Vishnoi" <vishnoianil@gmail.com>
Subject: RE: Socket programming
Date: Fri, 27 Mar 2009 03:28:10 +0530
Message-ID: <000d01c9ae5d$f90b7900$eb226b00$@com>
References: <20090322054220.1C330C2D@resin14.mta.everyone.net> <e694f9e00903221139s7bfa84hb295698fe86e864a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language
         :x-cr-hashedpuzzle:x-cr-puzzleid;
        bh=AXd43HuU4VtLj4efn9PV0yueaBO5MFWqayXkzOcpGqM=;
        b=CzYnq5U0MKBj1GOE+j5bwDS08MnzJ2hRQEGbGfqgEBiJ2yI1gDayrs88Caus9AMrZX
         5/Bt4MHAgfgjiQi/LTIykdmDlSGPoNlijlEBi8ENGcED1S4+LOnuOtVRxcT/20mWC5//
         8pyM6tntFJkRgmm8nwxc0W572cO6WFLJZREJE=
In-Reply-To: <e694f9e00903221139s7bfa84hb295698fe86e864a@mail.gmail.com>
Content-Language: en-us
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jon Mayo' <jon.mayo@gmail.com>, ajhwb@knac.com, linux-c-programming@vger.kernel.org

Hi,
	I think solution suggested by Jon is the complete one, because if I understand correctly your intent is to replicate the dynamic data which is pointed by the pointer member of the struct foo too on the other side of socket. Solution given by Canaan will possibly solve the half of the problem, but by that way you will not be able to send the content pointed by *name & *pix in the struct foo. So you need to send those data as well across the socket (which jon is doing) and need to allocate the memory equal to the string pointed by the *name & *pix and need to cast accordingly.

Cheers 
Anil 

-----Original Message-----
From: linux-c-programming-owner@vger.kernel.org [mailto:linux-c-programming-owner@vger.kernel.org] On Behalf Of Jon Mayo
Sent: Monday, 23 March 2009 00:09
To: ajhwb@knac.com; linux-c-programming@vger.kernel.org
Subject: Re: Socket programming

On Sun, Mar 22, 2009 at 5:42 AM, Ardhan Madras <ajhwb@knac.com> wrote:
> Hi All,
>
> I was written small network utility in Linux 2.6, glibc 2.7.
> I have been using send() and recv() system call in SOCK_STREAM
> to send or receive fixed size data. for example, i write my data
> structure like this:
>
> struct foo
> {
>  char name[16];
>  char pix[1024];
>  int id;
> } bar;
>
(cut)

When I deal with serializing/deserializing data over a stream socket I
prefer to define a few common "atoms" and build a complete system from
that. For example I see you have char and int in your struct.

/* p : pointer to one or more ints
 * count : number of ints
 */
int recv_int (int s, int *p, unsigned count)
{
 int total, res;

 /* a loop that ensures the entire data is sent - if you wish to have
a program that handles multiple sockets using select() you need to do
this differently, like with one big read into a large buffer */
 for(total=0; total < (count * sizeof *p); total+=res) {
   res=recv (s, (char*)p+total, (count * sizeof *p)-total, 0);
   if (res=<0) return 0; /* closed or there was an error */
 }

 /* you could byte swap each element after receiving the data */

 return total;
}

/* p : pointer to one or more ints
 * count : number of ints
 */
int send_int (int s, int *p, unsigned count)
{
 int total, res;

 /* you could byte swap each element before sending */


 /* a loop that ensures the entire data is sent - if you wish to have
a program that handles multiple sockets using select() you need to do
this differently, like copy encoded data into a large output buffer
first */
 for(total=0; total < (count * sizeof *p); total+=res) {
   res=recv (s, (char*)p+total, (count * sizeof *p)-total, 0);
   if (res=<0) return 0; /* closed or there was an error */
 }

 return total;
}

/* for completeness - not significantly different from recv()/send() */
int recv_char(int s, char *p, unsigned count) { return recv (s, p,
count * sizeof *p, 0); }
int send_char(int s, char *p, unsigned count) { return send (s, p,
count * sizeof *p, 0); }



Then from those atoms you build up calls for your particular data structure:

int recv_foo(int s, struct foo *f)
{
 int res;
 /* if you want name and pix to be variable size you could read an
int for the length, then malloc() space for it, then read the bytes in
*/
 res=recv_char(s, f->name, sizeof f->name);
 if (res<=0) return res;
 res=recv_char(s, f->pix, sizeof f->name);
 if (res<=0) return res;
 res=recv_int(s, &f->id, 1);
 if (res<=0) return res;
 return 1;
}


I didn't actually try or compile any of it, just typed up a rough idea
of how you can do it.

A popular alternatives to your hand made binary protocol include:
* Just use an text based protocol. That's how HTTP, SMTP, NNTP, IRC, etc work.
* BEEP Core protocol - text based with easy ways for handling binary data
* ASN.1 - a standardized encoding and description format for binary
data (mainly for protocols). asn1c is a utility to generate C
serialize stubs from ASN.1 descriptions.
* SunRPC and XDR - part of 'rpcgen' utility for defining standard
SunRPC encode/decode.
* XML rpc - a standardized form for using XML as a protocol.

If you must have binary I would recommend you go with ASN.1 or SunRPC
over writing your own thing. But overall I would recommend one of the
text based options. The stuff to learn about socket programming will
still be there even if you use someone else to serialize the data for
your. Encoding data is a completely different skill that is separate
from socket programming.
--
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

