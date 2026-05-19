pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
	cartdata("flow")
	nm=""
	e=1
	st=1
	l="a"
	tm=1
	tp=0
	nms={}
	tms={}
	qnt=0
	nma=nil
	tma=nil
	lma=nil
	play=false
	pts=dget(0)
	ext=0
	limi=false
	reini=0
end

function _update()
	if btn(5) and btn(2) then 
		reini+=1
	else
		if(reini!=0) reini=0
	end
	if(reini==50) then
		reini+=1
		nm=""
		e=1
		st=1
		l="a"
		tm=1
		tp=0
		nms={}
		tms={}
		qnt=0
		nma=nil
		tma=nil
		lma=nil
		play=false
		pts=0
		dset(0,0)
		ext=0
		limi=false
		sfx(3)
	end
	cls()
	hora=stat(93)..":"
	..(stat(94)<10 and 0 or "")
	..stat(94)
	print(hora.." \#dflow\n",10,10,7)
	if limi and t()%1==0 and 
	ext>0 then
		ext-=1
	end
	
	if limi and ext==0 then
		pts=0
		dset(0,0)
		tma=nil
		lma=nil
		nma=nil
		e=1
		play=false
		limi=false
		sfx(-1)
		sfx(2)
	end
	
	
	
	
	print("\fdsequencia: "..pts
	..(limi and "\f8" or "\f7")
	.."  extra: "..
	flr(ext/60)..
	":"..(ext%60<10 and 0 or "")
	..ext%60 .."\n")
	
	
	print("adicionar", --/
	e==1 and st==1 and 12 or 7)
	
	if nma then
		print("finalizar", --/
		e==2 and st==1 and 12 or 7)
	end
	
	if st==1 then
		if(btnp(2) and e>1)e-=1
		if(btnp(3) and nma and e<2)e+=1
	
		if e==2 and btnp(4)
		and t()-tp>0 then
			tma=nil
			lma=nil
			nma=nil
			e=1
			tp=t()
			ext+=tmp
			play=false
			limi=false
			pts+=1
			dset(0,pts)
			sfx(-1)
			sfx(1)
		end
		
	end
	if e==1 and st==1 --/
	and btnp(4) and t()-tp>0 then 
	--::
		st=2
		tp=t()
	end
	
	if st==2 then
	--::
		print("\n\f7->\fe"..nm..l)


		--sistema de escrita >>>
		if(btnp(2))l=chr(ord(l)-1)
		if(btnp(3))l=chr(ord(l)+1)
		if(ord(l)==96 or ord(l)==123)l=" "
		if(ord(l)==31)l="z"
		if(ord(l)==33)l="a"
		if(btnp(1))nm..=l l="a"
		
		if btnp(0) and #nm>0 then
			l=sub(nm,#nm,#nm) 
			nm=sub(nm,1,#nm-1)
		end
		
		if btnp(4) and t()-tp>0 then
			st=3 
			tp=t()
			if(l!=" ")nm..=l
		end 
		if btnp(5) then
			st=1
			nm=""
			l="a"
		end
		-->>>>>>>>>>
			
	end
	if st==3 then
		print("\n\f7->"..nm.." / \fe"..tm.." min",12)
		if(btnp(1))tm+=1
		if(btnp(0) and tm>1)tm-=1
		
		if btnp(4) and t()-tp>0 then
			
			qnt+=1
			nms[qnt]=nm
			tms[qnt]=tm
			
			nm=""
			e=1
			st=1
			l="a"
			tm=1
			tp=t()
		end
		if btnp(5) then
			st=2
			tm=1
			l=sub(nm,#nm,#nm)
			nm=sub(nm,1,#nm-1)
		end
	end
	
	
	if qnt>0 and not tma then
		tma=t()
		lma=tms[1]*60
		nma=nms[1]
		del(nms,nms[1])
		del(tms,tms[1])
		qnt-=1
	end
	
	if tma then
		if t()-tma<lma then 
			tmp=lma-flr(t()-tma)
			print("\n\fc"..nma.." / "
			..flr(tmp/60) ..":"
			..(tmp%60<10 and "0" or "")
			..tmp%60,7)
		else 
			if not play then 
				play=true sfx(0) limi=true
			end
			print("\n\f7"..nma.." / "
			.."\f80:00")
		end
	end
	
	
	
--lista >>>>
	print("\n",66,22)
	for i=1,qnt do
		print(nms[i].." -- "
		..tms[i].." min",7)
	end
-->>>>>>>>>>

rect(0,0,127,127,7)
print("❎🅾️",110,120)
end
__gfx__
00000000000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700777007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700770770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700770000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
870f00201c17018170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7f0a0000181501c2501f3502415000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
671400001f1521e1521d1521c1521c1521c1521c15200000000000000000000000001015004150000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
61100000185521c5521f5522355224552245522455224552000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
