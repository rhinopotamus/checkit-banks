def generator():
    x=var("x")
    from sage.calculus.integration import numerical_integral

    
    
    
    functions=[
        sqrt(randint(1,5)*x+randint(1,5)),
        randint(1, 3)*sin(randint(1,3)*x),
        randint(1, 3)*cos(randint(1,3)*x),
        randint(1,5)*e^(randint(1,5)*choice([-1,1])*x)+randint(-5,5),
        randint(1,5)*choice([-1,1])*x^randint(1,5)+randint(1,5)*choice([-1,1])*x^randint(1,5),
        #3*e^(-4*x) - 4
    ]
    
    f(x)=choice(functions)
    
    fp(x)=diff(f(x),x)
    
    integrand = sqrt(1 + (fp(x))^2)
    
    a=randint(0,3)
    b=a+randint(1,4)
    
    arclength = numerical_integral(integrand, a, b)[0]

    return {
      "f": f(x),
      "fp": fp(x),
      "integrand": integrand,
      "a": a,
      "b": b,
      "arclength": arclength,
    }