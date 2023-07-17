def generator():
    h=var("h")
    from sage.symbolic.integration.integral import definite_integral

    length = randint(1,5)*5
    
    function = choice([
            randint(1,5)/(1+x^2),
            exp(-round(randint(1,5)/10,1)*x),
            sqrt(randint(1,5)+x),
            ln(randint(2,5)+x)
        ])
    
    return {
      "length": length,
      "function": function,
    }

