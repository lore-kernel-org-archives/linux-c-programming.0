From: Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Subject: 64 bits integer - ERRATA
Date: Wed, 10 Nov 2004 00:31:20 -0300
Message-ID: <41918B88.3060807@ig.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Excuse me, when I say "64 bits", I m assuming that the OS are running 
under a processor with 32 bits only,  where "long" type ll have only 32 
bits and "double" could has 64 bits, but it isn't a integer, in other 
hands, I couldn't convert a double to a text string assuming that it is 
integer with a function like printf().

Then, retrying the question:
Does exist a way or some system call or another thing in Linux that 
allow us to manipulate integer values larger than a system DWORD (long) ?
Samples:
- int64, atoi64(), i64toa(), ...
- int128, atoi128(), i128toa(), ...

Luciano


-------- Mensagem Original --------
Assunto: 	64 bits integer
Data: 	Tue, 09 Nov 2004 22:30:57 -0300
De: 	Luciano Moreira - igLnx <lucianolnx@ig.com.br>
Para: 	linux-c-programming <linux-c-programming@vger.kernel.org>


How can we do to manipulate integer higher than 32 bits in linux ?

Does exist some system call (or another library), that allow us to do 
something like as following ?

int64 x;
x = atoi64("12345678901234567890");

char x[21];
i64toa(x, sizeof(x));

Thanks,

Luciano

-
To unsubscribe from this list: send the line "unsubscribe linux-c-programming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html



