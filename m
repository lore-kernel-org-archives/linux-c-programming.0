From: "Mariano Moreyra" <moremari@aca.org.ar>
Subject: RE: named structure members
Date: Thu, 11 Sep 2003 11:03:59 -0300
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <000401c3786d$8cfc01c0$0b04a8c0@aca.org.ar>
References: <20030911110742.GD6863@3d-computers.co.uk>
Reply-To: <mariano_moreyra@aca.org.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <20030911110742.GD6863@3d-computers.co.uk>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Matthew Harrison' <matth@3d-computers.co.uk>, linux-c-programming@vger.kernel.org

> what i'm doing is stepping thru an array of different config options
> calling the read_config_var on each one and checking the output.
> if the output is good then i want to store the value in a member of
> a structure. for example i want the config options to be stored like
> this:

> config.db_host = 'maiden.genestate.com'
> config.db_user = 'root'

> you get the idea. my question is how do i dynamically assign a name
> to a structure member. I have good_values[i] which contains the
> current config directive but if you look at line 8 of the example,
> you can see the problem, how do i say config.good_values[i], when
> good_values[i] is not itself a member.

I think that I get the idea ...
But are you sure that is that what you want??
I mean, the idea is that in your config option you could have any config
directives (or keys) and values??
How you will handle that options later without knowing from the begining
what options you could have??
Anyway...I think that you could do is create your structure like this:

 typedef struct {
	char key[255];
	cahr value[255];
 } t_config;

 t_config config[20];   // Change 20 and 255 to adapt to your needs


 so your code would look like this:

for(i = 0; i < n_values; ++i)
        {
                strcpy(keyword, good_values[i]);

                switch (read_config_var(values_file, keyword, value))
                {
                        case 0:
                                strcpy(config[i].key, keyword);
					  strcpy(config[i].value, value);
                                break;
                        case -1:
                                printf("\nFile Error for [%s] \n",
values_file);
                                break;
                        case -2:
                                printf("\nBad User Parm for [%s] \n",
keyword);
                                break;
                        default:
                                printf("\nUnknown Error Occurred \n");
                                break;
                }
        }


I'm not sure if is that what you want...and if I really understood your
problem...
So, let me know if this mail sucks! :)

--
Mariano Moreyra <mariano_moreyra@aca.org.ar>

