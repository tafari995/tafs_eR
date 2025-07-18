# tafs_eR

Using python 3.10.12 in a virtual environment on a linux os. Here is my python solution to the Project Euler number 95! Please see requirements.txt for dependencies.

the code is Not fast at 10**6 (actually Quite Slow in comparison to C++ code I've found on the internet) but it does work on my laptop with 12GB ram and i5 9th gen processor, with 8 cores :)

To run the amicPairsAnswerFile.py efficiently (i.e. to ensure cython is used), I run 'python3 cy_setup.py build_ext' from the command line on my linux machine before running amicPairsAnswerFile.py (which does not need the command line). I'm new to cython, so perhaps this is standard, I've only skimmed their docs.
