def generator():
    import random
    
    [[choice1,ans1], [choice2,ans2], [choice3,ans3]] = random.sample([
            ["The population of a colony of rabbits grows continuously at a rate proportional to the population.",
             "\\dfrac{dP}{dt} = kP"],
            ["A sample of carbon-14 loses mass at a rate proportional to its mass.",
             "\\dfrac{dM}{dt}=-kM"],
            ["You have a bank account that continuously earns 4% interest every year. At the same time, you withdraw money continually from the account at the rate of $1000 per year.",
             "\\dfrac{dA}{dt} = 0.04A - 1000"],
            ["A cup of hot chocolate is sitting on the counter. The temperature of the hot chocolate cools at a rate proportional to the difference between the hot chocolate\'s temperature and the room\'s temperature.",
             "\\dfrac{dh}{dt} = k(h - r)" ],
            ["A can of cold soda is sitting on the counter. The temperature of the soda warms at a rate proportional to the difference between the soda\'s temperature and the room\'s temperature every minute.",
             "\\dfrac{ds}{dt} = k(s-r)"],
            ["A dose of medication is eliminated from the bloodstream of a patient at a rate proportional to the amount in the bloodstream.",
             "\\dfrac{dM}{dt} = -kM"],
            ["When a skydiver jumps from a plane, gravity causes her downward velocity to increase at the rate of g ≈ 9.8 meters per second squared. At the same time, wind resistance causes her velocity to decrease at a rate proportional to the velocity.",
             "\\dfrac{dv}{dt} = 9.8 - k\\cdot v"],
            ["During the first few years of life, the rate at which a baby gains weight is proportional to the reciprocal of its weight.",
             "\\dfrac{dW}{dt} = k\\dfrac{1}{W}"],
        ], 3)
    return {
        "choice1": choice1,
        "choice2": choice2,
        "choice3": choice3,
        "ans1": ans1,
        "ans2": ans2,
        "ans3": ans3,
    }