From: Ken Nagorski <rocket@refriedgeeks.com>
Subject: working with threads
Date: Tue, 31 Jan 2006 22:19:01 -0500
Message-ID: <43E028A5.2040406@refriedgeeks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-c-programming@vger.kernel.org

Hi there,

I have created a small IM client that talks to an IM server that I wrote 
in java. It doesn't have a problem sending data however I am using a 
pthread to call a listener function. It works OK but when I click back 
on the program say to type some other text it just crashes. I have been 
teaching myself C but I am having a problem understanding how to pass 
control back to the main thread. That isn't a problem in java.

forgive me if I am not even asking this right cause like I said. I am 
teaching this to myself as my school doesn't offer C.

below is the code maybe someone will be able to point me in the right 
direction.

how the thread is created.
when the user clicks connect and if there is a successful sockfd 
created... I call this
listner_thread_id = pthread_create( &listner_thread, NULL, 
message_listner, (void *)data_to_be_sent);

The message listener function
static void *message_listner(void *data)
{
        struct Data_To_Be_Sent *data_to_be_sent;
        data_to_be_sent = (Data_To_Be_Sent*)data;
        gchar *text;
        gchar *carriage_return = "\n";
        GtkTextIter start, end;
        int numbytes, ix=1;

        g_print("I am waiting for incoming data...\n");
        while(1)
        {
                if((numbytes=recv(data_to_be_sent->sockfd, 
data_to_be_sent->buffer, 255, 0)) == -1)
                {
                        printf("There was an error reciving data\n");
                        exit(1);
                } else {
                        printf(((char *)data_to_be_sent->buffer));
                        printf("\n%i\n", ix);
                        wait(2);
                }
                ix++;
        }
}

Any ideas where I am going wrong?

Thanks
ken

