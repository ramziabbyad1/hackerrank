
class myComplex(complex):
	
	def __sub__(self, other):
		zsub = complex(self) - complex(other)
		return myComplex(zsub.real, zsub.imag)

	def __mul__(self, other):
		zmult = complex(self) * complex(other)
		return myComplex(zmult.real, zmult.imag)
	
	def __add__(self, other):
		zsum = complex(self) + complex(other)
		return myComplex(zsum.real, zsum.imag)
	
	def __div__(self, other):
		zdiv = complex(self) / complex(other)
		return myComplex(zdiv.real, zdiv.imag)
	
	def abs(self):
		conj = abs(complex(self))
		return myComplex(conj.real, conj.imag)
	
	def __str__(self):
		real = round(self.real, 2)
		imag = round(self.imag, 2)
		if real == 0 and imag == 0:
			return '0.00'
		return '{:.2f}'.format(self.real) +  '{:+.2f}'.format(self.imag)+'i'
		
Carr = map(float, raw_input().split())
Darr = map(float, raw_input().split())

C = myComplex(Carr[0], Carr[1])
D = myComplex(Darr[0], Darr[1])

print C + D
print C - D
print C * D
print C / D
print C.abs()
print D.abs()
