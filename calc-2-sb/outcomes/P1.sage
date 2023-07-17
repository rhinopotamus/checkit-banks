def generator():
    from sage.symbolic.integration.integral import definite_integral
    
    x=var("x")
    k=var("k")

    
    funct=choice(['power', 'exp'])
    
    a=Integer(randint(2,4))
    b=choice([-1,1])
    c=Integer(randint(1,3))
    d=Integer(randint(1,5))*choice([-1,1]) 
    
    if funct=='power':
        seq=d*b^k*k^c
        seqf(k)=d*b^k*k^c      
    if funct=='exp':
        seq=d*b^k*a^k 
        seqf(k)=d*b^k*a^k       
        
        
        
    degree=randint(2,5)
    center=randint(-5,5)
    close=center+choice([-0.5, -0.2, -0.1, 0.1, 0.2, 0.5]) #choice([-1,1])*choice([0.1, 0.2, 0.5])

    poly=0
    for i in range(degree+1):
              poly=poly+seqf(i)/factorial(i)*(x-center)^i

    approx = poly(x=close)

    return {
      "a0": seqf(0),
      "a1": seqf(1),
      "a2": seqf(2),
      "a3": seqf(3),
      "a4": seqf(4),
      "a5": seqf(5),
      "a6": seqf(6),
      "degree": degree,
      "center": center,
      "seq":seq,
      "poly":poly,
      "close":close,
      "approx":approx
    }
