import sys              # for command line args
import random           # for number generator

min = int(sys.argv[1])  # all have to be ints
max = int(sys.argv[2])
num = int(sys.argv[3])

random.seed(num)        # set the seed

value = random.randint(min, max)

print(value)