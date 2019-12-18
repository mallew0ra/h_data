#!/usr/bin/python 3

import hashlib

def hash(inF, outF):
  for line in inF.readlines():
      encSha = hashlib.sha256(line.strip('\n').encode('utf-8')).hexdigest()
      outF.write(encSha+'\n')

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
