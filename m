From: ronkhu <ronkhu@ntsp.nec.co.jp>
Subject: Re: question on socket connection
Date: Mon, 26 May 2003 10:30:17 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3ED17C39.5040107@hq.ntsp.nec.co.jp>
References: <3ED175DF.6050503@hq.ntsp.nec.co.jp>
Reply-To: ronkhu@ntsp.nec.co.jp
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming <linux-c-programming@vger.kernel.org>


  readSet = socketSet;
  if ( select( highestSocketValue + 1, &readSet, NULL, NULL, NULL ) > -1 )
  {
      .
      .
      .
      
      if ( FD_ISSET( mySocket, &readSet ) )
      {
        size = recv( mySocket, message, MAX_MSG_SIZE - 1, 0 );
        if ( size == 0 )
        {
           close( mySocket );
           FD_CLR( mySocket, &socketSet );
        }
        else
        {
           printf( "%s\n", message );
        }
      }
      
      .
      .
      .
      
  }    
  

