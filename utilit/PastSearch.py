#!/usr/bin/python3 

import os, hashlib, sys, time, requests

def banner():
    print('''
    LOL Start }:>
    ''')
def write(url, ofile):    
    if connect(url):
        ofile.write(url)
        ofile.flush()

def connect(url):
    try:
        resp = requests.get(url).text
        if 'Cant find this shit!' in resp: 
            return False 
        else:
            print('Finaly: '+url);
            return True        
    except:pass
#        print('[-]')
#        time.sleep(0.5)
#        connect(url)




def main():
    ofile = open(sys.argv[1],"a+")
    ofile.write('\n-----------------------------------\n')
    banner()
    while True:
        key = str(hashlib.md5(os.urandom(32)).hexdigest())
        url = 'http://depastedihrn3jtw.onion/show.php?md5='
        url += str(key)
        write(url, ofile)
        
if __name__ == '__main__':main();
