def generator():
    """
    Generates
    x' = _t^_x^_+_t^_y^_+_x^_y^_+_
    y' = _t^_x^_+_t^_y^_+_x^_y^_+_
    with one term zeroed, and asks for
    x,y at t=t_0+2h for h=0.1
    """

    def random_ode(t,y):
        cs = [randrange(1,5)*choice([-1,1]) for _ in range(3)]
        cs[choice([0,1,2])]=0
        return cs[0]*t^randrange(1,3)*y^randrange(1,3) + \
            cs[1]*t^randrange(2,4) + \
            cs[2]*y^randrange(2,4) + randrange(-3,4)


    while True:
        t,y=var('t y')
        yp=random_ode(t,y)
        t_0,y_0 = (randrange(-2,3) for _ in range(2))
        if yp(t=t_0,y=y_0)==0:
            continue
        h=(choice([2,3])/10).n(digits=2)
        vals=[{"t":t_0,"y":y_0}]
        for i in range(2):
            t_n=vals[i]["t"]
            y_n=vals[i]["y"]
            vals.append({
                "t": (t_n+h).n(digits=2),
                "y": (y_n+h*yp(t=t_n,y=y_n)).n(digits=3),
            })
        if vals[-1]["y"].abs() < 100 and vals[-1]["y"].abs() > 1/100:
            break

    return {
        "yp": yp,
        "init": vals[0],
        "final": vals[-1],
        "vals": vals[1:],
        "h": h,
    }


''' my modified version 
def generator():
    """
    Generates
    y' = _t^_+_y^_+_
    and asks for
    y at t=t_0+5h for h=0.1, 0.2, or 0.5.
    """

    def random_ode(t,y):
        cs = [randrange(1,5)*choice([-1,1]) for _ in range(3)]
        return cs[0]*t + \
            cs[1]*y + \
            cs[2]

    while True:
        t,y=var('t y')
        yp=random_ode(t,y)
        t_0,y_0 = (randrange(-2,3) for _ in range(2))
        if yp(t=t_0,y=y_0)==0:
            continue
        h=choice([0.1, 0.2, 0.5])
        vals=[{"t":t_0,"y":y_0,"slope":yp(t=t_0,y=y_0),"dy":h*yp(t=t_0,y=y_0),}]
        for i in range(5):
            t_n=vals[i]["t"]
            y_n=vals[i]["y"]
            dy_n = vals[i]["dy"]
            vals.append({
                "t": (t_n+h),#.n(digits=2),
                "y": (y_n+dy_n),#.n(digits=5),
                "slope": yp(t=t_n+h, y=y_n+dy_n),#.n(digits=5),
                "dy": h*yp(t=t_n+h, y=y_n+dy_n),#.n(digits=5),
            })
        if vals[-1]["y"].abs() < 100 and vals[-1]["y"].abs() > 1/100:
            break

    return {
        "yp": yp,
        "init": vals[0],
        "final": vals[-1],
        "vals": vals,
        "h": h.n(digits=1),
    }
'''

'''
def generator():
    t=var("t")
    y=var("y")
    de(t,y) = y-t #asdlkfjalsdfjklasdjflkajsdflkjasdflkjasdlkfj randomize
    dt = 0.2 #choice([0.1, 0.2, 0.5])
    t0 = 0 # randrange(0, 5)
    tf = t0 + 5*dt
    y0 = -1 # randrange(-3,3)
    
    ys = [y0]
    ts = [t0]
    des = []
    dys = []
    
    Datalist = []
    
    for i in range(6):
        des.append(de(ts[i], ys[i]))
        dys.append(des[i]*dt)
        ys.append(ys[i] + dys[i])
        ts.append(ts[i] + dt)
        
    for i in range(6):
        entry = {
            "ti": ts[i],
            "yi": ys[i],
            "dei": des[i],
            "dyi": dys[i],
        }
        Datalist.append(entry)
        
    return {
        "dt": dt,
        "de": de,
        "t0": t0,
        "tf": tf,
        "Datalist": Datalist,
    }
'''