
from cython_prj_amicPairs import lamic_underN
import time 
import multiprocessing

#print(f"{answer} \n ")

def main(core_count):
      # A larger range for a more evident effect of multiprocessing
    t=0
    T=1*(10**5)
    result = multiprocessing.Array('i', T-t)
    segment = T-t // core_count
    processes = []

    for i in range(core_count):
        '''
        start = i * segment
        
        if i == core_count - 1:
            end = T-t  # Ensure the last segment goes up to the end
        else:
            end = start + segment
        # Creating a process for each segment
        '''
        p = multiprocessing.Process(target=lamic_underN, args=(t+i*segment,t+(i+1)*segment))
        processes.append(p)
        p.start()

    for p in processes:
        p.join()

    return result
    
t_0=time.time()
main(6)
t_1=time.time()
print(f"\n time elapsed: {t_1 - t_0}")

#answer=14316, chain length 28 time is approximately 454 seconds or 7.567 minumtes
