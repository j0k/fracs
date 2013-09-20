NB. Koh snowflake

NB. 1 - sin, 2 - cos
sin=:1&o.
cos=:2&o.
rfd=: 180 %~ o.			NB.rad <- degree
] pi =: rfd 180
] phi60 =: pi%3
rotx =: ( {. * cos@[ ) - ({: * sin@[ )
roty =: ( {. * sin@[ ) + ({: * cos@[ )

]'p0 p1'=:(0 0);(100 100)		

NB. take p_start;p_end as y
funca =: 3 : 0
   'p0 p4'=. y
   'p1 p3'=.  p0 (+"1 1) ((1 2)%3) (*"0 _) p4 - p0 
   p2 =. p1 + phi60 (rotx,roty) p1 - p0
   _2[\ p0,p1,p2,p3,p4
)

repeat =: ((2:[\ ])@: funca @:(_2:[\ ])@:, "2)

present =: 3 : 0
	res =. _2[\, y
	d   =. 0 { $ res
	f   =. 0 { res
	f, (2|i. d) # res
)


]data =: present (repeat^:5) 1 2 2$, p0,p1
NB. (repeat^:2) 1 2 2$, p0,p1

readf  =: 1!:1
writef =: 1!:2

fn =: < '/tmp/snowKoh.dat'
cdata =: ": data
]ddata =: cdata ,"1 LF
(,ddata) writef fn

NB. test test test
data =: (repeat^:4) 2]\_2]\0 0 0 100 50 50 0 0
data =: (repeat^:1) 2]\_2]\0 0 0 100 50 50 0 0
]data =: present (repeat^:1) 1 2 2$, p0,p1

NB. debug
load 'debug'
dbss 'funca *:*'
dbr 1
dbrun ''			NB.times
dbr 0
dbss ''

{: i.10