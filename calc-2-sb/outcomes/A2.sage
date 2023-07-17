def generator():
    x=var("x")
    y=var("y")
    from sage.symbolic.integration.integral import definite_integral

    m=randint(1,3)
    power = choice([1/2, 1, 2, 3])
    f(x) = m*x^power
    g(y) = (1/m*y)^(1/power)
    
    right = randint(1,6)
    top = f(right)
    
    leftaxis = randint(-4, -2)

    return {
        "f": f(x),
        "g": g(y),
        "right": right,
        "top": top,
        "leftaxis": leftaxis,
    }
