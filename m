From: Glynn Clements <glynn@gclements.plus.com>
Subject: Re: how to implement tail -n
Date: Mon, 24 Jan 2005 19:26:52 +0000
Message-ID: <16885.19452.391228.523655@gargle.gargle.HOWL>
References: <1106461572.1122.1.camel@KrishnaMohan>
	<20050123184550.B330@Imrashi.net.bd>
	<1106487378.1122.14.camel@KrishnaMohan>
	<009a01c501d8$6d504cf0$dc846840@apac.cisco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <009a01c501d8$6d504cf0$dc846840@apac.cisco.com>
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Venkatesh Joshi <joshiv@cisco.com>
Cc: LinuxC <linux-c-programming@vger.kernel.org>


Venkatesh Joshi wrote:

> I would like to know how to implement "tail -n" in C.

Use a circular buffer which contains the last N lines read. Each time
you read a line, remove the first line and add the new line to the end
of the buffer. When you reach the end, display the contents of the
buffer.

E.g.

void tail(FILE *fp, int num_lines)
{
	char **buffer = calloc(num_lines, sizeof(char *));
	int index = 0;
	int i;

	for (;;)
	{
		char *line = NULL;
		int len = 0;

		if (getline(&line, &len, fp) < 0)
			break;

		if (buffer[index])
			free(buffer[index]);

		buffer[index] = line;

		index++;
		index %= num_lines;
	}

	for (i = 0; i < num_lines; i++)
		puts(buffer[(index + i) % num_lines]);
}

In practice, you would probably want to do your own memory allocation
rather than using getline(). You also need to allow for files with
less than num_lines lines..

> The "-n" option will be used to print the last n lines of a file -
> rather than the default option of printing the last 10 lines of a file.
> 
> I wish to do this in a single pass. I can use lseek() to go to the end
> of the file. How to traverse backwards from there ? Is there any
> function that does this ?

Use lseek(SEEK_CUR) with a negative offset to seek backwards. You
would have to use trial and error to determine how much you need to
read.

Also, lseek() will only work on regular files. It won't work on pipes,
etc. The "tail" command works on pipes.

-- 
Glynn Clements <glynn@gclements.plus.com>
