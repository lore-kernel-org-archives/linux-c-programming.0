From: Glynn Clements <glynn.clements@virgin.net>
Subject: Re: named structure members
Date: Thu, 11 Sep 2003 16:50:05 +0100
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <16224.39341.204427.234601@cerise.nosuchdomain.co.uk>
References: <20030911110742.GD6863@3d-computers.co.uk>
	<000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar>
	<20030911142642.GD14403@3d-computers.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030911142642.GD14403@3d-computers.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Harrison <matth@3d-computers.co.uk>
Cc: Mariano Moreyra <moremari@aca.org.ar>, linux-c-programming@vger.kernel.org


Matthew Harrison wrote:

> here is the struct that i want my config to go into:
> 
> <snip>
> typedef struct _CFG_struct
> {
>         char *db_host;
> 	char *db_name;
> 	char *db_pass;
> 	char *db_user;
> }CFG;
> </snip>
> 
> and I am doing the following (pseudo code)
> 
> <snip>
> for(i = 0; i <= array_of_config_items; i++)
> {
> 	keyword = array_of_config_items[i];
> 
> 	while (read_config_file != EOF)
> 	{
> 		check_return_value;
> 		if keyword = 'item1'
> 		{
> 			item1 = value;
> 		}
> 		elsif keyword = 'item2'
> 		{
> 			item2 = value;
> 		}
> 		and_so_on();
> 	}
> }
> </snip>

There are a number of ways which you could improve upon this, but
there isn't anything along the lines of:

	config.<something involving "keyword"> = value;

Structure fields have to be specified explicitly; you can't "index" a
structure in the manner of an associative array.

One possible solution is:

enum cfg_option {
	cfg_db_host,
	cfg_db_name,
	cfg_db_pass,
	cfg_db_user,
	CFG_COUNT
};

static const char * const option_names[CFG_COUNT] = {
	"host",
	"name",
	"pass",
	"user"
};

struct cfg {
	char *options[CFG_COUNT];
};

static int set_option(struct cfg *config, const char *keyword, const char *value)
{
	int i;

	for (i = 0; i < CFG_COUNT; i++)
	{
		if (strcmp(option_names[i], keyword) != 0)
			continue;

		config->options[i] = strdup(value);
		return 0;
	}

	fprintf(stderr, "option %s not found\n", keyword);
	return -1;
}

You would then access the options as e.g. config.options[cfg_db_host]
etc.

> i can sort it now with the multiple if's but now it segfaults on
> a strcpy for some reason

The reason is that the pointers in the structure aren't pointing to
valid memory. You probably want to use strdup(), i.e.

	config.db_host = strdup(value);

-- 
Glynn Clements <glynn.clements@virgin.net>
