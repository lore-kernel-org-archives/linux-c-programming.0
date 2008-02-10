From: "Christian Stalp" <christian.stalp@gmx.de>
Subject: Re: sprintf with mips
Date: Sun, 10 Feb 2008 23:25:59 +0100
Message-ID: <20080210222559.17830@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-c-programming-owner@vger.kernel.org>
Sender: linux-c-programming-owner@vger.kernel.org
List-ID: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-c-programming@vger.kernel.org

The whole procedure is here: (its a thread!)

void *dblogger_fn (void *arg)
{
	char insertvalues[256];
	memset (insertvalues, 0x0, 256 );
        conn =3D PQconnectdb("host=3D192.168.1.2 dbname=3Dwlan_db  user=
=3Dgavle password=3Dbrynaes");
        tabellename =3D "traffic";
=09
	if (PQstatus(conn) =3D=3D CONNECTION_BAD)=20
	{
		fprintf(stderr, "Connection to database '%s' failed.\n",dbName);
		fprintf(stderr, "%s", PQerrorMessage(conn));
		exit_nicely(conn);
  	}
  	else if (PQstatus(conn) =3D=3D CONNECTION_OK)=20
  	{
  		printf("Connected with database ...\n");
  		printf("Datenbank : %s\n", PQdb(conn));
  		printf("User      : %s\n", PQuser(conn));
  	}
  	while(1)
  	{
  		sleep(500);
  		snprintf(insertvalues, 255 ," %d , ' %s ' , %d ", counter, "192.168=
=2E1.1", mytraffic->num_frames);
  		printf("input-string: %s\n", insertvalues);
  		printf("Counter: %d\n", counter);
		insertinto(dbName, conn, tabellename, insertvalues);
		counter++;
  	}

I don't know where is here a chance for an overflow? Consider, now with=
 'snprintf' it works, but before with sprintf there was this problem, B=
UT only on the mips-target board. On x86 it worked also with sprintf!

Gruss Christian


Paul Jackson wrote:
>> are there any known problems with sprintf under mips?
>
> Is there any chance that some other line of code, perhaps
> writing an adjacent variable, is overflowing onto the
> front of this insertvalues[] array, between the sprintf
> and the printf?
>
> In other words, I'll wager that whatever bug you're seeing
> is neither in the code fragements quoted here, nor in the
> sprintf libc code, but in some other nearby code.
>

--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt?
Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger
-
To unsubscribe from this list: send the line "unsubscribe linux-c-progr=
amming" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
