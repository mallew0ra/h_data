#!/usr/bin/python 3

import base64
from urllib.parse import quote

def comURL(inF, outF):
  for line in inF.readlines():
      encUrl = quote(line.strip('\n'), safe='')
      outF.write(encUrl+'\n')

def comBase64(inF, outF):
  for line in inF.readlines():
      cod64 = base64.b64encode(bytes(line.strip('\n'), 'utf-8'))
      outF.write('data%3Atext/html%3Bbase64%2C' + cod64.decode('utf-8') +'\n')

def main():
  fileIn = input('Input File > ')
  print('=> {}\n'.format(fileIn))
  inFile = open(fileIn, 'r')
  fileOut = input('Output File > ')
  print('=> {}\n'.format(fileOut))
  otFile = open(fileOut, 'a')
  swich = input('choose (1) Base64_encode OR (2) URL_encode OR (3) for both: ')
  if swich == '1' or '2' or '3':
      if swich == '1':
          comBase64(inFile, otFile)
      elif swich == '2':
          comURL(inFile, otFile)
  else:
      print('type num. 1 or 2')
  inFile.close()
  otFile.close()

if __name__ == '__main__': main();
