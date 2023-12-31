def generator():
    h=var("h")
    from sage.symbolic.integration.integral import definite_integral

    
    scenario = choice(["bucket","well","dam"])
    #scenario = choice(["dam"])
    
    if scenario=="bucket":
        height=randint(4,8)*5
        bucket=randint(2,5)*5+5*e^(-1*randint(1,20)/10*h)
        work=bucket*98/10
        return {
            scenario: True,
            "height": height,
            "bucket": bucket,
        }
    
    if scenario=="well":
        height=randint(4,8)*5
        radius=randint(2,5)
        return {
            scenario: True,
            "height": height,
            "radius": radius,
        }
    
    
    
    if scenario=="dam":
        height=randint(4,8)*5
        bottom=randint(5,9)*5
        top=randint(10,15)*5
        width=bottom+(top-bottom)*(1-h/height)
        force=width*62.4*h
        return {
            scenario: True,
            "height": height,
            "bottom": bottom,
            "top": top,
            "width": width,
            
        }
