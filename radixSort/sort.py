import random

def getData():
    data = [] 
    for i in ( range(0,100) ):
        data.append(random.randint(0,1000) )

    print "INIT: " + str( data )
    return data

def sort(data):
    
    basepos = -1;
   
    while(True):
        keyArray = []
        passArray = []

        for i in range(10):
            keyArray.insert(i,0)
        for i in range(0, len(data) ):
            passArray.insert(i,0)

        for num in data:
            
            if num >= 10 ** (( basepos * -1) - 1 ):
                keyArray[ int( str(num)[ basepos ]) ] += 1
            else:
                keyArray[ 0 ] += 1

        if keyArray[ 0 ] == len(data):
            break
        
        for pos in range(1, 10):
           keyArray[ pos ] += keyArray[ pos - 1]
        
        for pos in range( 1, len(data) + 1):

            keyIndex = 0
            if data[ pos * -1] >= 10 ** (( basepos * -1) - 1 ):
                keyIndex = int( str( data[ pos * -1 ] )[ basepos ]) 

            keyArray[ keyIndex ] -= 1

            passArray[ keyArray[ keyIndex ] ] = \
              data[ pos * -1]

        data = passArray
        print "Pass: " + str( basepos * -1) + " " + str(data) 
        basepos -= 1
    return data

def main():

  numiter = 1000
  numfalse = 0.0
  for i in range(numiter):
      data = getData()
      mysort = sort( data ) 
      thsort = sorted(data)

      for i in range(len(data)):
          if mysort[i] != thsort[i]:
              print "HIS:" +str (thsort)
              numfalse += 1
              break
  print str( float( (numfalse/numiter) * 100 ) )


main()
