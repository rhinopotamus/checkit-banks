def generator():
    t=var('t')
    y=var('y')
    
    #generate some random coefficients
    cs = [randrange(1,5) for _ in range(2)]
    cs[0] = cs[0]*choice([-1, 1])
    t0 = randrange(-2,3)
    y0 = randrange(1,3)*choice([-1,1])
    
    # pick a DE
    yp,soln = choice([
            (cs[0]*t/y, sgn(y0)*sqrt(cs[0]*t^2+(y0^2-cs[0]*t0^2)) ),
            #(cs[0]*(y-cs[1]), cs[1]+(y0-cs[1])/exp(cs[0]*t0)*exp(cs[0]*t) ),
            (y^2*(cs[0]+t), -1/(t^2/2+cs[0]*t+(-1/y0-cs[0]*t0-t0^2/2))),
            (cs[0]*10*y*t^(cs[1]),
             y0/exp(cs[0]*10*t0^(cs[1]+1)/(cs[1]+1))* \
             exp(cs[0]*10*t^(cs[1]+1)/(cs[1]+1)))
        ])
    
    return {
        "yp": yp,
        "t0": t0,
        "y0": y0,
        "soln": soln
    }