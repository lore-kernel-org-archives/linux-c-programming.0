From: David Eduardo Gomez Noguera <davidgn@servidor.unam.mx>
Subject: signaling a thread to stop
Date: 14 Apr 2002 09:38:02 -0600
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <1018798684.4455.17.camel@hikaru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-2022-jp"
To: linux c programming <linux-c-programming@vger.kernel.org>

Hello.
I am writting a gtk program that comunicates with a pen pad. when it
starts writting, it starts doing it in "real time", just as the pen
moves, there is flow of data, so a toggle button creates a thread, and
will need to stop it too.

what is the best way to do it?

i read on libc info page pthread_cancel, but didnt understand what does
it exactly do.
I think it signals the thread, then the thread must tests its value to
see if it has been "canceled" and decide upon an action (after the
thread itself was set to CANCEL_ENABLE)what to do, am i right?

the thread needs to stop comunication with the pad, so it does not keep
sending data, and then flush any remaining data when asked to stop. And
unlock a mutex.

-- 
ICQ: 15605359 Bicho
                                  =^..^=
First, they ignore you. Then they laugh at you. Then they fight you.
Then you win. Mahatma Gandhi.
-------------------------------気検体の一致------------------------------------
暑さ寒さも彼岸まで。
恋にししょうなし。恋はしあんの他。
アン アン アン とっても大好き


