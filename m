From: Nir Dremer <mailing@dremer.org>
Subject: Re: newby.-interpreting C
Date: Mon, 20 Dec 2004 21:38:09 +0200
Message-ID: <1103571489.28578.14.camel@localhost>
References: <cq77vi$1ej$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <cq77vi$1ej$1@sea.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: soraberri <421246@posta.unizar.es>
Cc: linux-c-programming@vger.kernel.org


this specific attributes is intended in order to avoid structure
alignment in memory.
The compiler is performing alignment to any allocation to be a
multiplication of 4k.
in order to disable this alignment __attribute__ packed is being used.

usually this is being used when working with networking:
if you have a structure of 5k and you will send it you will actually
send 8k.

attributes information:
http://www.unixwiz.net/techtips/gnu-c-attributes.html


cheers

On Mon, 2004-12-20 at 20:07 +0100, soraberri wrote:
> Hi all,
> 
> Anyone could give me the meaning of this definition? Is the 
> __attribute__ stuff what scares me. If you feel like I'm too 
> desoriented, please tell me what should I know first.
> 
> typedef struct {
> 	uint8_t b[6];
> } __attribute__((packed)) bdaddr_t;
> 
> thanks very much
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

