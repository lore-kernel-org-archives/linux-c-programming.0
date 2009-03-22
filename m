From: Jon Mayo <jon.mayo@gmail.com>
Subject: Re: Socket programming
Date: Sun, 22 Mar 2009 11:39:19 -0700
Message-ID: <e694f9e00903221139s7bfa84hb295698fe86e864a@mail.gmail.com>
References: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=FZF7mjFMc5pGWN62EQI9ZJ5Do3jmDZni56btWVzh8nk=;
        b=mA3rVXZxHllyrD+ney3zolYaTjv3Vvb7GzjTiy4tr8G+8kHhIJnS7MkO/RIeCXFINF
         XYCMWE+BNTFEfaORZG+D38CEz+ZiY6gw2wXSHcq5hr5h9TPf4xzUZ9M15OJDyihbzlZX
         ZRmYUrERNratF5Y757GGVdkYx63maM86WZg4A=
In-Reply-To: <20090322054220.1C330C2D@resin14.mta.everyone.net>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ajhwb@knac.com, linux-c-programming@vger.kernel.org

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
