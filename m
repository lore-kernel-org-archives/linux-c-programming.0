From: Stephen Kratzer <kratzers@pa.net>
Subject: Re: sprintf with mips
Date: Tue, 12 Feb 2008 09:17:45 -0500
Message-ID: <200802120917.46800.kratzers@pa.net>
References: <20080210222559.17830@gmx.net>
Reply-To: kratzers@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20080210222559.17830@gmx.net>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Stalp <christian.stalp@gmx.de>
Cc: linux-c-programming@vger.kernel.org

On Sunday 10 February 2008 17:25:59 Christian Stalp wrote:
> The whole procedure is here: (its a thread!)
>
> void *dblogger_fn (void *arg)
> {
> 	char insertvalues[256];
> 	memset (insertvalues, 0x0, 256 );
>         conn = PQconnectdb("host=192.168.1.2 dbname=wlan_db  user=gavle
> password=brynaes"); tabellename = "traffic";
>
> 	if (PQstatus(conn) == CONNECTION_BAD)
> 	{
> 		fprintf(stderr, "Connection to database '%s' failed.\n",dbName);
> 		fprintf(stderr, "%s", PQerrorMessage(conn));
> 		exit_nicely(conn);
>   	}
>   	else if (PQstatus(conn) == CONNECTION_OK)
>   	{
>   		printf("Connected with database ...\n");
>   		printf("Datenbank : %s\n", PQdb(conn));
>   		printf("User      : %s\n", PQuser(conn));
>   	}
>   	while(1)
>   	{
>   		sleep(500);
>   		snprintf(insertvalues, 255 ," %d , ' %s ' , %d ", counter,
> "192.168.1.1", mytraffic->num_frames); printf("input-string: %s\n",
> insertvalues);
>   		printf("Counter: %d\n", counter);
> 		insertinto(dbName, conn, tabellename, insertvalues);
> 		counter++;
>   	}
>
> I don't know where is here a chance for an overflow? Consider, now with
> 'snprintf' it works, but before with sprintf there was this problem, BUT
> only on the mips-target board. On x86 it worked also with sprintf!
>
> Gruss Christian

I would recommend stepping through with a debugger. It might also be worth 
while to compile with the -S option (if using gcc) and peruse the MIPS 
assembly.

Stephen Kratzer
Network Engineer
CTI Networks, Inc.

