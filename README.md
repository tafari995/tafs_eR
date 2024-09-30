# tafs_eR

using python 3.10.12 in a virtual machine. here is a full list of my imports for my python solution to the Project Euler number 95:

from distutils.core import setup
from Cython.Build import cythonize
import numpy as np
import cython
from math import sqrt
from copy import deepcopy
from cython_prj_amicPairs import lamic_underN
import time 
import multiprocessing

the code is Not fast at 10**6 (actually Quite Slow in comparison to C++ code I've found on the internet) but it does work on my laptop with 12GB ram and i5 9th gen processor, with 8 cores :)

To run the amicPairsAnswerFile.py efficiently (i.e. to ensure cython is used), I run 'python3 cy_setup.py build_ext' from the command line on my linux machine before running amicPairsAnswerFile.py (which does not need the command line). I'm new to cython, so perhaps this is standard, I've only skimmed their docs.
