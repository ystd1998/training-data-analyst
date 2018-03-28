import numpy as np
data = range(1000)
distData = sc.parallelize(data)
terms = distData.map(lambda k : 8.0/((2*k+1)*(2*k+1)))
res = np.sqrt(terms.sum())
print res
