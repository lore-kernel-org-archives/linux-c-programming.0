From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: socket send and recv
Date: Thu, 07 Aug 2003 18:46:18 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F322DFA.2030509@hq.ntsp.nec.co.jp>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Earl Lapus <lapuz.rl@mp.ncos.nec.co.jp>, "Lejanson C. Go" <g_l-go@tmg99.ntes.nec.co.jp>, linux-c-programming@vger.kernel.org

i have a client program which sends a sequence of bytes everytime 
anything(plus carriage return)  is inputted into STDIN...

but the problem lies in the receiving end of the socket connection...
with a single call of the recv() function, multiple messages sent by the 
client are concatenated into one stream..


    unsigned char msg[] = { 0x00, 0x00, 0x00, 0x20, 0x20, 0x01, 0x00, 
0x00, 0xB2, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 
0x00, 0x20, 0x03, 0x06, 0x03, 0x16, 0x20, 0x10, 0x00, 0x00, 0x00, 0x00, 
0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF };

        while(1)
        {
            FD_ZERO( &readSet );
            FD_SET( 0, &readSet );
            if ( select( 1, &readSet, NULL, NULL, NULL ) > 0 )
            {
                read( 0, temp, 10 );
                send( sock, msg, 40, 0 ));
            }
        }




because of this scenario, i was forced to add a sequence of bytes that 
would serve as a delimter separating the messages. The server program
would then pre-parsed the message by sub dividing the data using the 
delimeter sequence of bytes





