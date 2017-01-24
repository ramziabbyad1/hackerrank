from math import acos, degrees, sqrt

class Point:
    def __init__(self, A):
        self.x = A[0]
        self.y = A[1]
        self.z = A[2]

    def subtract(self, A):
        return Point([ self.x - A.x, self.y - A.y, self.z - A.z ])

    def cross_prod(self, B):
        return Point([ 
            self.y*B.z - self.z*B.y, 
            -self.x*B.z + self.z*B.x, 
            self.x*B.y - self.y*B.x 
        ])

    def dot_prod(self, A):
        return self.x * A.x + self.y * A.y + self.z * A.z

    def modulus(self):
        return sqrt(self.dot_prod(self))

A = Point(map(float, raw_input().split()))
B = Point(map(float, raw_input().split()))
C = Point(map(float, raw_input().split()))
D = Point(map(float, raw_input().split()))

AB = B.subtract(A)
BC = C.subtract(B)
CD = D.subtract(C)

X = AB.cross_prod(BC)
Y = BC.cross_prod(CD)

X_dot_Y = X.dot_prod(Y)
XY_modulus = X.modulus() * Y.modulus()

result = round(degrees( acos(X_dot_Y / XY_modulus) ), 2)

print result



