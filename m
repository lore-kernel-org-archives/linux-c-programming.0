From: b klein <b_klein1@yahoo.com>
Subject: Re: Graphs: Arbitrary Dijkstra's algorithm implementation
Date: Tue, 16 Dec 2003 12:46:07 -0800 (PST)
Sender: linux-c-programming-owner@vger.kernel.org
Message-ID: <20031216204607.11876.qmail@web41315.mail.yahoo.com>
References: <Pine.LNX.4.44.0312151149040.15956-200000@ns.isi.ulatina.ac.cr>
Mime-Version: 1.0
Return-path: <linux-c-programming-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44.0312151149040.15956-200000@ns.isi.ulatina.ac.cr>
List-Id: <linux-c-programming.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Fabio Miranda Hamburger <fabmirha@ns.isi.ulatina.ac.cr>
Cc: linux-c-programming@vger.kernel.org

hi
im a beginner here so please say if i do something off
topic.
i tried to set=20
#define     NODES   8
and then(i hope this is right) i changed the
constructor:
grafo(void) //inicializa la matriz de costos y los
> vectores temporales
>   {
>       //for (int i=3D1; i<=3D7; i++) was
> 	 //for (int j=3D1; j<=3D7; j++)
now=20
       for (int i=3D1; i<=3DNODES; i++) was
 	for (int j=3D1; j<=3DNODES; j++)
 	  costos[i][j]=3D10000;

>       costos[1][2]=3D200;
>       costos[1][4]=3D150;
>       costos[2][3]=3D100;
>       costos[3][1]=3D50;
>       costos[3][7]=3D25;
>       costos[4][3]=3D500;
>       costos[4][5]=3D200;
>       costos[5][6]=3D175;
>       costos[6][3]=3D250;
>       costos[7][5]=3D300;
>      // for (int i=3D1; i<=3D7; i++)
        for (int i=3D1; i<=3DNODES; i++)
>       {
> 	 vertices[i]=3Di;
> 	 vertices2[i]=3Di;
>       }
and then i founf=B4d that in the method=20
int grafo::buscaminimo(void)//busca el vertice con
// costo minimo de los no visitados
 {
 	int minimo=3D10000, pos=3D10000;
pos doesnt change, but it is returned. and the value
is used as an index of vertices2[w] in the method=20
dijkstra(void).
vertices2[] has a size of NODES.
so the index w=3D10000 is out of size.

--- Fabio Miranda Hamburger
<fabmirha@ns.isi.ulatina.ac.cr> wrote:
> Hi.
>=20
> I am trying to code a small program in Ansi C++ that
> somehow implements
> the famous Dijkstra algorithm that looks for the
> shortest path between 2
> nodes in a dinamic bidirectional directed pointer
> graph.
>=20
> Attached You will find the .cpp with both clases and
> implementations.
> The algorithm looks for the shortest path between 1
> and a given node,
> actually, the algorithm follow common graph
> implementation and uses a
> static biarray of "weights" (a distance between x ->
> y), for example,
> weight[2][5] =3D 10 means that there is a cost of 10
> from 2 to 5 without a
> scale in a other node of the same type.
>=20
> However, the algorithm is unable to use n > 6 nodes
> and I dont understand
> why, after a depuration and reading Tenenbaum's, I
> found out a function
> return "infinity" and afterwards an address memory
> violation. The
> algorithm should never return infinite because there
> is always a pending
> distance of the (latest-1 node ) !=3D infinite
>=20
> I would really appreciate any comments or help, my
> goal is to code a
> algorithm that takes a matrix of weigth and prints
> out the nodes of the
> shortest path of (1,x)
>=20
> best regards,
>=20
>=20
> ---
> Fabio Andres Miranda
> Ingenieria de sistemas informaticos
> Universidad Latina - Costa Rica
>=20
>=20
> > #define     NODES   8
> #define     INFINITY    10000 //the value
> representing a not numerical result path
> #define     costos  weight  // spanish -> english
>=20
> // problem =3D>  if nodes <=3D 8 the algorithm doesnt
> work
>=20
> #include<iostream.h>
> #include<conio.h>
> #include<string.h>
>=20
> class grafo // es la clase donde esta la clase y los
> algoritmos
> {
>   public:
>   void dijkstra(void);
>   void mascorto(void);
>   void caminos(int i, int j);
>   grafo(void) //inicializa la matriz de costos y los
> vectores temporales
>   {
>       for (int i=3D1; i<=3D7; i++)
> 	 for (int j=3D1; j<=3D7; j++)
> 	  costos[i][j]=3D10000;
>       costos[1][2]=3D200;
>       costos[1][4]=3D150;
>       costos[2][3]=3D100;
>       costos[3][1]=3D50;
>       costos[3][7]=3D25;
>       costos[4][3]=3D500;
>       costos[4][5]=3D200;
>       costos[5][6]=3D175;
>       costos[6][3]=3D250;
>       costos[7][5]=3D300;
>       for (int i=3D1; i<=3D7; i++)
>       {
> 	 vertices[i]=3Di;
> 	 vertices2[i]=3Di;
>       }
>   }
>   int D[NODES];//aqui van quedando los costos
> minimos
>   private:
>      int vertices[NODES]; //se guardan los vertices
>      int p[NODES][NODES];//se utiliza para sacar los
> caminos
>      int costos[NODES][NODES];//matriz donde estan
> los costos de ir de un vertice a otro
>      int vertices2[NODES];//aqui van quedando los
> vertices visitados
>      int w;//contiene el vertice visitado
> actualmente
>      int buscaminimo(void);
>      int min(int x, int y);
> };
> void grafo::dijkstra(void) //calcula los caminos
> minimos desde el vertice 1 hacia los demas
> {
>     int conjunto[NODES]; // aqui se van guardando
> los vertices no visitados
>     int posconjunto=3D1;
>     vertices[posconjunto]=3D0;
>     D[1]=3D0;
>     for (int i=3D2; i<=3DNODES-1; i++)
> 	D[i]=3Dcostos[1][i]; //inicializa el vector con los
> costos de 1 a i
>     for(int i=3D1; i<=3D NODES-2; i++)
>     {
>       w=3Dbuscaminimo();//deja en w el vertice no
> visitado con el menor costo en ese momento
>       posconjunto++;
>       conjunto[posconjunto]=3Dw;//inserta al vertice
> en los visitados
>       vertices2[w]=3D0;//saca al vertice los no
> visitados
>       for (int v=3DNODES-1-posconjunto; v<=3D7; v++)
> 	 D[v]=3Dmin(D[v],D[w]+costos[w][v]);//analiza si es
> menor por este camino(w) o por el que esta en este
> momento
>     }
> };
> int grafo::buscaminimo(void)//busca el vertice con
> costo minimo de los no visitados
> {
> 	int minimo=3D10000, pos=3D10000;
> 	for(int i=3D1; i<=3DNODES-1; i++)
> 	{
> 	  if (vertices2[i] !=3D0)
> 	     if (D[i] < minimo)
> 	     {
> 		minimo=3DD[i];
> 		pos=3Di;
> 	     }
> 	}
> 	return pos;
> };
> int grafo::min(int x, int y)//retorna el valor con
> menor costo
> {
>   if (x < y)
>      return x;
>   else
>       return y;
> };
> void grafo::mascorto(void)//saca la ruta de caminos
> mas cortos entre los vertices
> {
>   int i,j,k;
>   int a[NODES][NODES];
>   for (i=3D1;i<=3DNODES-1;i++)
>     for (j=3D1;j<=3DNODES-1;j++)
>     {
> 	a[i][j]=3Dcostos[i][j];
> 	p[i][j]=3D0;
>     }
>   for (i=3D1;i<=3DNODES-1;i++)
>       a[i][i]=3D0;
>   for (k=3D1;k<=3DNODES-1;k++)
>       for (i=3D1;i<=3DNODES-1;i++)
> 	  for (j=3D1;j<=3DNODES-1;j++)
> 	      if ((a[i][k]+a[k][j])<(a[i][j]))
> 	      {
> 		a[i][j]=3Da[i][k]+a[k][j];
> 		p[i][j]=3Dk;
> 	      }
> };
> void grafo::caminos(int i, int j)//imprime la ruta
> mas corta desde el vertice i hasta el j
> {
>    int k;
>    char c=3D' ';
>    k=3Dp[i][j];
>    if (k=3D=3D0)
>       return;
>    caminos(i,k);
>    cout<<k;
>    cout<<c;
>    caminos(k,j);
> }
> void main (void)
> {
>  grafo g;
>  g.dijkstra();
>  g.mascorto();
>  char c=3D' ';
>  char s[20]=3D"Camino M=A1nimo: ";
>  char s2[20]=3D"Costo: ";
>  for (int i=3D1; i<=3DNODES-1; i++)//este ciclo imprime
> los caminos minimos desde el vertice 1 hasta los
> dem=A0s
>  {
>    cout << s;
>    cout << 1;
>    cout << c;
>    g.caminos(1,i);
>    cout << i;
>    cout << c;
>    cout << s2;
>    cout << g.D[i]<<"\n";
>  }
>    getch();
> }
>=20
>=20
>=20


__________________________________
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing.
http://photos.yahoo.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-c-programmi=
ng" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
