import numpy as np

a = np.array([1,2,3,4,5])
print(a)

b = np.array([(4,6,9,7),(1,5,6,3)])
print(b)
print(type(b))
print(b.shape) 

c = np.zeros([3,3])
print(c)

d = np.ones([3,3])
print(d)

e = np.random.random((3,2))
print(e)

f = np.random.randint(1,9,(5,5))
print(f)

g = np.linspace(1,9,4)
print(g)

h = np.arange(10,50,4)
print(h)

list =[9,8,7,6,5]
i =np.asarray(list)
print(i)

print(b.ndim)

print(b.size)

j = np.array([(4,6,9,7),(1,5,6,3)],dtype = int)
print(j)

k = np.transpose(j)
print(k)
print(k.shape)

print(np.sort(j))

print(j.min())
print(j.max())
print(j.sum())

print(j[j<6])
print(j[j>=7])
print(j[(j>2)& (j<7)]) 
