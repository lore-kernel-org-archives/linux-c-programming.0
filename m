From: "Charlie Gordon" <gmane@chqrlie.org>
Subject: Re: feof fails
Date: Wed, 15 Sep 2004 16:23:48 +0200
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <ci9j8e$v56$1@sea.gmane.org>
References: <B0003441729@hermes.imsd.uni-mainz.de>
Return-path: <linux-c-programming-owner@vger.kernel.org>
List-Id: <linux-c-programming.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-c-programming@vger.kernel.org

"Christian Stalp" <stalp@imbei.uni-mainz.de> wrote in message
news:B0003441729@hermes.imsd.uni-mainz.de...
Hello together,
I have a simple problem. I opened a file with fopen and read from the file
with:
  while ( !feof( infile ) )
 {
   fgets( buffer, BUFFER_SIZE, infile );
   new_number = atoi ( buffer );
.....

The end of file condition is detected when trying to read from the file and
failing.
Thus feof(infile)  doesn't return non zero until after fgets fails at least
once.
You should test fgets return value to detect end of file.
The reason the last number is read twice is that your particular
implementation of fgets doesn't modify buffer upon end of file, it just
returns NULL, which you don't check before parsing the contents of the
buffer.

try this:

while (fgets(buffer, BUFFER_SIZE, infile)) {
    new_number = atoi(buffer);
    ...
}

simpler and better !

Chqrlie.

PS: wether the file is terminated with a newline or not is irrelevant to
this question.




