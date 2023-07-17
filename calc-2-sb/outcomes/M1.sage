def generator():
    
    [f,a,b] = choice([
            [sin(x)/x,1,2], # should avoid 0
            [e^(-x^2),-1, 1],
            [sqrt(1-x^4),0,1], #can only go from -1 to 1
        ])
    Deltax=(b-a)/10
    leftsum = Deltax*sum([f(x=a+Deltax*i) for i in range(10)])
    rightsum = Deltax*sum(f(x=a+Deltax*(i+1)) for i in range(10))
    trapezoid = 1/2*(leftsum + rightsum)
    midpoint = Deltax*sum([f(x=a + Deltax/2 + Deltax*i) for i in range(10)])
    simpsons = 2/3*midpoint + 1/3*trapezoid
    return {
        "f": f,
        "a": a,
        "b": b,
        "leftsum": leftsum.n(),
        "rightsum": rightsum.n(),
        "trapezoid": trapezoid.n(),
        "midpoint": midpoint.n(),
        "simpsons": simpsons.n(),
    }