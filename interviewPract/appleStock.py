import random

def findMaxProfit( priceArray ):
    
    priceDic = {}

    for time in range( 0,len(priceArray) ):
        priceDic[ priceArray[ time ] ] = time

    sortedPriceArray = sorted(priceDic.keys())

    minPointer = 0;
    maxPointer = ( len( sortedPriceArray ) - 1 )

    inIters = 0
    ouIters = 0

    while( minPointer != ( len( sortedPriceArray ) - 1) ):
        while( minPointer != maxPointer ):
            if( priceDic[ sortedPriceArray[ minPointer ] ] < priceDic[ sortedPriceArray[ maxPointer ] ] ):
                print str(inIters)
                print str(ouIters)
                return "BUY: " + str( priceDic[ sortedPriceArray[ minPointer ] ] ) \
                  + " SELL: " + str( priceDic[ sortedPriceArray[ maxPointer ] ] )

            ouIters += 1
            maxPointer -= 1
        
        inIters += 1
        maxPointer = ( len( sortedPriceArray ) - 1 )
        minPointer += 1

    return "BUY: 0 SELL: 0 "

        


def constructArray():
    
    price_array = []

    for i in range(0, 1000):
        price_array.append( random.randint(100,1000))

    return price_array


def main():
  print findMaxProfit( constructArray() )
  


if __name__ == "__main__":
    main()






