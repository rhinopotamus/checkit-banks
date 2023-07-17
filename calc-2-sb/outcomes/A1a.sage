def generator():
    import random
    from sage.symbolic.integration.integral import definite_integral
    
    b = randrange(2,8)
    c = -b*(1-b)
    pm = choice([-1, 1])
    pmy = pm*var("y")
    # Ok: so "xy" is the variable we want to integrate wrt, and "yx" is the other one.
    [xy, yx] = random.sample([var("x"),var("y")], 2)
    f(xy) = c-xy^2
    g(xy) = pm*xy
    integrand = f(xy)-g(xy)
    [end1, end2] = sorted([pm*(b-1), pm*(-b)])
    x=var("x")
    defint = definite_integral(f(x)-g(x), x, end1, end2)
    
    return {
        "xy": xy,
        "yx": yx,
        "c": c,
        "pmy": pmy,
        "end1": end1,
        "end2": end2,
        "integrand": integrand,
        "defint": defint,
    }