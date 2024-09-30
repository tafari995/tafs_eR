
from math import sqrt
#from itertools import chain
from copy import deepcopy
#import multiprocessing
import numpy as np
import cython


@cython.cfunc    
cpdef primFac(N: cython.int):
    factors=np.array([0]*20)
    factors[0]=1
    i:cython.int=0
    j:cython.int=2
    current_toFactor:cython.int=N
    while j<=current_toFactor:
        if current_toFactor==1:
            break
        if current_toFactor%j==0:
            factors[i+1]=j
            i+=1
            current_toFactor=int(current_toFactor/j)
            j=1
        
        j+=1
    return factors[factors != np.array(0)]   
    
#print(primFac(7002))
    
# need to fix divsum now that factorization has been cython optimized
@cython.cfunc
cpdef divsum(N:cython.int):
    factors=primFac(N)[1:]    
    powers:np.array=np.bincount(factors)[1:]
    powers=powers[powers != np.array(0)]
    
    result:cython.int=1
    total_exp_index:cython.int=0
    while total_exp_index<powers.shape[0]:                      
        good_exp=powers[total_exp_index]                   
        current_term:cython.int=0
        
        k:cython.int=0
        while k<=good_exp:
            current_term=current_term+factors[0]**k
            k+=1
        
        result=current_term*result
        #print(f"\n the current result is {result}")
        factors=factors[factors !=factors[0]]       
        total_exp_index+=1
        
    
    return result-N



@cython.cfunc        
cpdef fast_chain_process(N:cython.int):
    ch_length:cython.int=1
    current_min:cython.int=N
    to_add=divsum(N)
    
    j:cython.int=0
    while j<sqrt(N):
        if to_add==N:
            return (current_min,ch_length)
        elif to_add<N or to_add>10**6:
            #print(f"{to_add} isn't in a valid chain :(")
            break
        if to_add<current_min:
            current_min=deepcopy(to_add)
        
        ch_length+=1
        to_add=divsum(to_add)
        
        j+=1
    
        
#print(fast_chain_process(14316))

   
def lamic_underN(t:cython.int,T:cython.int):    
    current_min,current_length=(1,1)
    while t<T:
        x=fast_chain_process(t)    
        if not type(x)==type(None):
            if x[1]>current_length:
                current_min,current_length=x
        t+=1
    print(current_min,current_length)

#T=500    
#lamic_underN(T)
#at 10**5, gives chain start as 14316, and chain length =28

