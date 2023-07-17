def generator():
    unstable = randrange(0,5)
    stable = randrange(6,10)
    return {
        "unstable": unstable,
        "stable": stable,
    }