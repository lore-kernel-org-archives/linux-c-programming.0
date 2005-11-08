From: Steve Graegert <graegerts@gmail.com>
Subject: Re: what is the char ~ mean
Date: Tue, 8 Nov 2005 06:42:29 +0100
Message-ID: <6a00c8d50511072142x736ef017kfdf4d70f7070809c@mail.gmail.com>
References: <003801c5e40f$c11cce20$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <003801c5e40f$c11cce20$060ae29f@javaboy>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jywang <jywang@cnic.cn>
Cc: linux-c-programming@vger.kernel.org

On 11/8/05, jywang <jywang@cnic.cn> wrote:
> in linux source code, i find this line,
> ~tcp_v4_check(...).
>
> what is the character ~ mean.

It means 'one's complement of'.  Look at the example to understand its usage:

int main(void) {
	/*   4 = 0000 0000 0000 0100 */
	unsigned int value = 4;
	/* 4294967291 = 1111 1111 1111 1011 */
	value = ~value;
}

In your case, this would mean: "create the one's complement of the
return value of tcp_v4_check".

	\Steve
