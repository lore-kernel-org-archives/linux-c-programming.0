From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: Unicode or not?
Date: Mon, 5 Mar 2012 19:57:25 +0000
Message-ID: <20309.6821.928204.159114@cerise.gclements.plus.com>
References: <jj2b8n$uka$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <jj2b8n$uka$1@dough.gmane.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Krzysztof <kj@limes.com.pl>
Cc: linux-c-programming@vger.kernel.org


Krzysztof wrote:

> Does it happen that command line which is passed to program arguments
> is "unicoded"? In other words, when should "main" be defined as
> "main(int argc, wchar_t **argv)"?

Never. Windows supports a wmain() function which uses wchar_t** for
argv, but there is no equivalent on Unix.

Unix doesn't normally use wide strings for communication between
programs or between programs and the OS. Unicode text invariably uses
UTF-8.

-- 
Glynn Clements <glynn@gclements.plus.com>
