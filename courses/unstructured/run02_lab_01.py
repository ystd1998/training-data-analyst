data = [0, 1, 2, 3, 4, 5]  # range(6)
distData = sc.parallelize(data)
squares = distData.map(lambda x : x*x)
res = squares.reduce(lambda a, b : a + b)
print res
