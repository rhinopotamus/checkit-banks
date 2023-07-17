def generator():
    from sage.symbolic.integration.integral import indefinite_integral
    from sage.symbolic.integration.integral import definite_integral

    x=var("x")

    slope=randint(1,5)*choice([-1,1])
    intercept=randint(-5,5)
    u(x)=slope*x + intercept
    
    vpfactors=[
        e^x,
        cos(x),
        sin(x),
    ]
    
    shuffle(vpfactors)
    vp(x)=vpfactors[0]
    
    #k=randint(1,5)*choice([-1,1])
    
    
    #dfdx=k*u(x)*vp(x)
    dfdx=u(x)*vp(x)
    
    f=indefinite_integral(dfdx, x)
    
    a=randint(-5,5)
    b=randint(a+1, a+6)
    
    fp(x)=dfdx
    
    defint=definite_integral(fp(x),x,a,b)

    
    

    return {
        "f": f.expand(),
        "dfdx": dfdx,
        "a": a,
        "b": b,
        "defint": defint,
    }
