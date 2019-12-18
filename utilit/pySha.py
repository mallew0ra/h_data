#!/usr/bin/python 3

import hashlib

def hash(inF, outF):
  for line in inF.readlines():
      encSha = hashlib.sha256(line.strip('\n').encode('utf-8)).hexdigest()
      #encUrl = quote(line.strip('\n'), safe='')
      outF.write(encSha+'\n')
      #print(hashlib.sha256("666".encode('utf-8)).hexdigest())

def main():
  fileIn = input('Input File > ')
  print('=> {}\n'.format(fileIn))
  inFile = open(fileIn, 'r')
  fileOut = input('Output File > ')
  print('=> {}\n'.format(fileOut))
  otFile = open(fileOut, 'a')
  hash(inFile, otFile)
  inFile.close()
  otFile.close()

if __name__ == '__main__': main();
