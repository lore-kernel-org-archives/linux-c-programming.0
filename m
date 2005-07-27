From: Holger Kiehl <Holger.Kiehl@dwd.de>
Subject: Re: Unsigned off_t?
Date: Wed, 27 Jul 2005 20:09:40 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0507271947480.12329@praktifix.dwd.de>
References: <Pine.LNX.4.61.0507250842380.3913@praktifix.dwd.de>
 <17125.51475.763052.283552@cerise.gclements.plus.com>
 <Pine.LNX.4.61.0507260638110.22613@praktifix.dwd.de>
 <17127.13918.931421.884967@cerise.gclements.plus.com>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <17127.13918.931421.884967@cerise.gclements.plus.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Glynn Clements <glynn@gclements.plus.com>
Cc: linux-c-programming@vger.kernel.org

On Wed, 27 Jul 2005, Glynn Clements wrote:

>
> Holger Kiehl wrote:
>
>> The problem I have with this is how do I use this with printf() or fprintf()?
>> What do I use: %u, %lu or %llu? Does C99 provide a solution here?
>
>       7.8  Format conversion of integer types <inttypes.h>
>
>       [#1] The header <inttypes.h> includes the header  <stdint.h>
>       and extends it with additional facilities provided by hosted
>       implementations.
>
>       [#2] It  declares  four  functions  for  converting  numeric
>       character  strings  to greatest-width integers and, for each
>       type declared in <stdint.h>, it defines corresponding macros
>       for   conversion  specifiers  for  use  with  the  formatted
>       input/output functions.169)
>
>       Forward references:  integer types <stdint.h> (7.18).
>
>       7.8.1  Macros for format specifiers
>
>       [#1] Each of the following object-like macros170) expands to
>       a   character   string   literal   containing  a  conversion
>       specifier, possibly modified by a length modifier,  suitable
>       for   use   within   the  format  argument  of  a  formatted
>       input/output  function  when  converting  the  corresponding
>       integer  type.   These  macro names have the general form of
>       PRI (character string literals for the  fprintf  family)  or
>       SCN (character string literals for the fscanf  family),171)
>       followed  by  the  conversion  specifier, followed by a name
>       corresponding  to  a  similar  type  name  in  7.18.1.   For
>       example,  PRIdFAST32 can be used in a format string to print
>       the value of an integer of type int_fast32_t.
>
>       [#2] The fprintf macros for signed integers are:
>
>           PRId8          PRId16         PRId32         PRId64
>           PRIdLEAST8     PRIdLEAST16    PRIdLEAST32    PRIdLEAST64
>           PRIdFAST8      PRIdFAST16     PRIdFAST32     PRIdFAST64
>           PRIdMAX        PRIdPTR
>
>           PRIi8          PRIi16         PRIi32         PRIi64
>           PRIiLEAST8     PRIiLEAST16    PRIiLEAST32    PRIiLEAST64
>           PRIiFAST8      PRIiFAST16     PRIiFAST32     PRIiFAST64
>           PRIiMAX        PRIiPTR
>
>       [#3] The fprintf macros for unsigned integers are:
>
>           PRIo8          PRIo16         PRIo32         PRIo64
>           PRIoLEAST8     PRIoLEAST16    PRIoLEAST32    PRIoLEAST64
>           PRIoFAST8      PRIoFAST16     PRIoFAST32     PRIoFAST64
>           PRIoMAX        PRIoPTR
>
>           PRIu8          PRIu16         PRIu32         PRIu64
>           PRIuLEAST8     PRIuLEAST16    PRIuLEAST32    PRIuLEAST64
>           PRIuFAST8      PRIuFAST16     PRIuFAST32     PRIuFAST64
>           PRIuMAX        PRIuPTR
>
>           PRIx8          PRIx16         PRIx32         PRIx64
>           PRIxLEAST8     PRIxLEAST16    PRIxLEAST32    PRIxLEAST64
>           PRIxFAST8      PRIxFAST16     PRIxFAST32     PRIxFAST64
>           PRIxMAX        PRIxPTR
>
>           PRIX8          PRIX16         PRIX32         PRIX64
>           PRIXLEAST8     PRIXLEAST16    PRIXLEAST32    PRIXLEAST64
>           PRIXFAST8      PRIXFAST16     PRIXFAST32     PRIXFAST64
>           PRIXMAX        PRIXPTR
>
>> Besides, what do I use for uint64_t in printf()?
>
> The PRIu64 macro.
>
Thanks for the information!

>>> Out of curiosity, why do you want an unsigned off_t anyhow?
>>
>> I use it to store the number of bytes I have send to a certain host.
>> If this is unsigned there is no need to worry about an overflow and I can
>> always just add each file size transmitted. Just when I want to calculate
>> the transfer rate I need to watch out for an overflow.
>
> Why not just use "long long" or "int64_t"?
>
> If you're sending multiple files, I can't see any reason why the total
> amount of data sent would depend upon sizeof(off_t).
>
You are right, that is a much better solution. Thanks!

> If you're always using a 64-bit type, there isn't any reason to use
> unsigned. I'm fairly certain that you aren't going to be sending more
> than 2^63 bytes; even at 1Gbit/sec, that would take ~2000 years.
>
> If you're using a 32-bit type, overflow is a realistic possibility
> regardless of whether you use signed or unsigned.
>
Yes this is what happened to my surprise. On one platform off_t is only
32-bit and overflowed very quickly.

Holger

