From: "Lejanson C. Go" <lejanson@ntsp.nec.co.jp>
Subject: another socket connection question
Date: Thu, 03 Jul 2003 11:14:58 +0800
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <3F039FB2.3070600@hq.ntsp.nec.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org


             Client                       Server
               .                             .
               .                             .
               .    retry connect until      .
               o---------------------------->.
               .         success             .
               .                             .
               .<----------------------------o
               .                             .
               .                             .
               .                             .
               .                             .
               .      getServerNodeId        .
               o---------------------------->.  Server wont be ready
               .    retry until success      .  until some time
               .                             .
               .                             .



I am trying to make a client server application where a client
is trying to get the nodeId of the server.

The server opens up its ports and my client connects to the server.
If unsuccessful the client side will retry to connect until it is
successful.

Considering the client is connected. Client application then will
send a GetServerNodeId request to the server.

What if the server is not ready to receive any request, how will
I make my GetServerNodeId request to be sent without errors? My
client application displays "Broken Pipe" when I run the client.


Steps in Testing:

1. run server
2. client connects to server until success
3. server is not ready to read requests
4. getServerNodeId - retry until success.


My problem revolves on my getServerNodeId request. Since my client
application have no way of knowing if the server is already accepting
requests from the client.

Can anyone help me please?


Here is a code snippet of the getServerNodeId :


//--------------------- SNIP -----------------------------//

inti sendNMCommand( void *data, inti size )
{
   int ret = -1;

   if (nmCmdSockConnected == FALSE)
   {
     return (ERR);
   }

   ret = write( nmCmdSock, data, size );

   if (ret != size)
   {
       return (ERR);
   }

   return( ret );
}


inti getServerNodeId(void)
{
   MSG_HEADER     header;
   NODE_INFO      node_info;
   int    stat;
   char   *str;
   struct in_addr tmpAddr;

   memset( &header, 0, sizeof(header));
   memset( &node_info, 0, sizeof(node_info));

   header.msg_type     = CLI_NM_MSG_TYPE_NODE_ID | 
CLI_NM_MSG_TYPE_COMMAND_SHOW;
   header.msg_size = sizeof(header);

   stat = sendNMCommand( &header, sizeof(header) );

   if (stat == ERR )
   {
     return(ERR);
   }

   memset( &header, 0, sizeof(header));

   stat = read(nmCmdSock, &header, sizeof(header));

   if (stat <= 0)
   {
     return (ERR);
   }

   if (header.msg_ret_code != CLI_NM_MSG_RETCODE_SUCCESS)
   {
     return (ERR);
   }

   if (header.msg_type == (CLI_NM_MSG_TYPE_NODE_ID | 
CLI_NM_MSG_TYPE_COMMAND_SHOW))
   {
     stat = recvNMData( &node_info, sizeof(node_info), &nmCmdSock);
     if (stat == ERR)
     {
       return (ERR);
     }

     tmpAddr.s_addr = node_info.node_id;
     str = inet_ntoa(tmpAddr);
     setPrompt(str);
   }
   else
   {
     return (ERR);
   }
   return(OK);
}


//--------------------- SNIP -----------------------------//





->end.









