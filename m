From: "Huber, George K RDECOM CERDEC STCD SRI" <George.K.Huber@us.army.mil>
Subject: RE: Into the Void
Date: Wed, 26 Jan 2005 11:02:36 -0500
Message-ID: <D2AA47A6FB2C1A48AF0526440C0F245CAA3632@monm207.nae.ds.army.mil>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

Scott wrote:

>Years ago, I learned this trick from somebody in the C/C++ Journal, or
>whatever that rag was called:
>
>           memcpy(*data_buf,bp,len)[len] = '\0';
>
>I get the following error:
>
>indatax.c: In function `read_datum':
>indatax.c:374: warning: dereferencing `void *' pointer
>indatax.c:374: invalid use of void expression

My first question would be what is the type of `data_buf'?

Secondly, as others have mentioned, the prototype for memcpy is:

void* memcpy(void* dest, const void* src, size_t len);

so you need to supply the address of a source buffer and the address
of a destination buffer.  The statement `*data_buf' can be thought of 
as saying "get the value stored in the memory location pointed to by
data_buf" (i.e. dereference data_buf).

From looking at your example, I take that what you are doing is copying 
data in `bp' to the buffer `data_buf' and then appending a null-terminator
to `data-buf'.  Assuming that data_buf and buf are properly declared and 
defined, the following should work:

       ((char*)memcpy((void*)data_buf, (const void*)bp, len))[len];

While your `trick' works, it probably is a maintenance nightmare - the 
intent is not immediately clear.  I would probably do the same thing in
two steps:

memset((void*)data_buf, '\0', len);                 // fills data_buf with nulls...
memcpy((void*)data_buf, (const void*)bd, len-1);    // copy the data...

Hope this helps,
George
