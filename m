From: Vadiraj <vadiraj.cs@gmail.com>
Subject: ternary operator
Date: Tue, 28 Jun 2005 22:52:16 +0530
Message-ID: <6eee1c405062810224f4db7e5@mail.gmail.com>
Reply-To: Vadiraj <vadiraj.cs@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-c-programming-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-c-programming-owner@vger.kernel.org
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-c-programming <linux-c-programming@vger.kernel.org>

Hi List,

 I'm confused with the behavior of this program..

func4()
{
    return 3;
}
func3()
{
    return 2;
}
func2()
{
}

func1()
{
    return(func2()?func3():func4()) ;
}
int main()
{
     
     printf("%d\n",func1() ) ;                       // this prints 3
     printf("%d\n",func2()?func3():func4()) ;  // this prints 2
}

 I dont understand whats making the two statements to behave differently.



-- 
cheers,
Vadi
