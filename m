From: soraberri <421246@posta.unizar.es>
Subject: Re: newby.-interpreting C
Date: Tue, 21 Dec 2004 16:39:18 +0100
Message-ID: <cq9g4e$62u$1@sea.gmane.org>
References: <cq77vi$1ej$1@sea.gmane.org> <20041220211709.GD2460@lug-owl.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20041220211709.GD2460@lug-owl.de>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Jan-Benedict Glaw wrote:
> On Mon, 2004-12-20 20:07:54 +0100, soraberri <421246@posta.unizar.es>
> wrote in message <cq77vi$1ej$1@sea.gmane.org>:
> 
>>Hi all,
>>
>>Anyone could give me the meaning of this definition? Is the 
>>__attribute__ stuff what scares me. If you feel like I'm too 
>>desoriented, please tell me what should I know first.
>>
>>typedef struct {
>>	uint8_t b[6];
>>} __attribute__((packed)) bdaddr_t;
> 
> 
> Compilers do use __attribute__ to allow programmers to modify the
> compiler's behavior in certain areas. "packed" tells the compiler to not
> start each variable at a natural alignment (ie. 4 bytes on a 32bit
> machine, 8 bytes on a 64bit machine). (That is, the address of a given
> variable must be a multiple of 4 (or 8) bytes.)
> 
> A "packed" structure is usually used for two things:
> 
> 	- In device drivers to fit a hardware device's memory-mapped
> 	  register structure
> 	- In poorly written programs to store variables into on-disk
> 	  files to be read back later on by other programs.
> 
> General rule: if you don't *need* this for a good reason, or if you even
> don't know what it does, you don't need it, since it also introduces a
> performance penalty: CPUs tend to be fast at naturally aligned memory
> accesses, but quite slow on non-aligned accesses.
> 
> MfG, JBG
> 

All rigth, it has been very helpful, thank you very much

regards
Luis

