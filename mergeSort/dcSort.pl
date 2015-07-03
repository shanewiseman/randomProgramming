#!/usr/bin/perl
use strict;



my $inputArray = [];
my $counter = 0;

foreach(1...5000000){ push ( @{ $inputArray } , int( rand( 1_000_000 ) ) ); }
$inputArray = dcSort( $inputArray );
foreach my $element ( @{$inputArray} ){ print $counter++." [" . $element . "]\n"; }





sub dcSort(arrayref){
   my $inputArray;
   
   if   (ref($_[0]) eq "ARRAY"){ $inputArray = $_[0];}
   else { $inputArray = \@_ ; }

   if( scalar( @{$inputArray} ) == 1){ return $inputArray; }
   if( scalar( @{$inputArray} ) == 2 ){
	if( $inputArray->[0] >= $inputArray->[1] ){
		my $temp=$inputArray->[1];
		$inputArray->[1] = $inputArray->[0];
		$inputArray->[0] = $temp;
	}
   }
   if( scalar( @{$inputArray}) > 2 ) {$inputArray = _merge(  dcSort( @{$inputArray}[0 ..  ( int( scalar( @{$inputArray} )/2 ) -1 )] ) , 
				                             dcSort( @{$inputArray}[int( scalar( @{$inputArray} )/2 ) .. ( scalar( @{$inputArray} ) -1 )] )
																); }	
	
   elsif                             ( scalar( @{$inputArray} ) == 2 ){
   else                              { return $inputArray; } 
   
   return $inputArray;

}
sub _merge(arrayref,arrayref){
	my  $input1 = $_[0];
	my $input2 = $_[1];
	my $returnArray = [];

	while( scalar( @{$input2} ) ){
	   if   ( scalar(@{$input1}) == 0 || $input1->[0] >= $input2->[0] ){ push( @{$returnArray} , shift( @{$input2} ) ); }
	   else { push( @{$returnArray} , shift( @{$input1} ) ); } 
	}
	push(@{$returnArray}, @{$input1});
	
        return $returnArray;
}





