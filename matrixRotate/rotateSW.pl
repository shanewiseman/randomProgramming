use strict;

my $size = shift || 3;
my $matrix = [];

initMatrix();
printMatrix();
rotateMatrix();
printMatrix();

sub rotateMatrix(;$$){
  #starting position, upper leftmost
  my $startX = shift || 0;
  my $startY = shift || 0;

  #algo will walk right until it reachs the outer wall
  my $xMax = ($size - 1) - $startX;

  #if we're at the outer wall no more rotating
  if($xMax <= 0 ){ return; }

  #start writing at the start point
  my $writeX = $startX;
  my $writeY = $startY;
  my $iterX = $startX;

  #keep walking right until we've reached the outer column 
  while( $iterX < $xMax ){ 

    #store the start point
    my $temp = $matrix->[ $writeY ][ $writeX ]; 

    #determine whos supposed to replace this index
    my $readY = $writeX;
    my $readX = abs( $writeY - ($size - 1 ));

    #keep going until we're back at the start of this iteration`
    while( ( $readX != $iterX || $readY != $startY) ){

      $matrix->[ $writeY ][ $writeX ] =
        $matrix->[ $readY ][ $readX ];

      # where we just read from will be the next write point
      $writeY = $readY;
      $writeX = $readX;

      #determine which index will be going to the new write point
      my $tempY = $readY;
      $readY = $readX;
      $readX = abs( $tempY - ( $size - 1 ) );

    }

    #the read pointer is back at the beginning, write the value we've saved 
    $matrix->[ $writeY ][ $writeX ] =
      $temp;
   
    #walk right on row 
    $iterX++;
    
    #the start write index is at the beginning of the next iteration point
    $writeY = $startY;
    $writeX = $iterX;
  }

  #we've rotated the outer indexs, move diagonal in one and rotate it,
  # this will keep going until the startX is moved into a index already sorted
  rotateMatrix( ($startX + 1), ($startY + 1) );

}


=comment
#not in place example

sub rotateMatrix(;$$){
  my $min = shift || 0;
  my $max = shift || ( $size - 1 );

  my $newMatrix = [];
  foreach my $y ($min...$max){
      foreach my $x ($min...$max){
        $newMatrix->[ abs( $x - ($size - 1) ) ][$y] = 
          $matrix->[$y][$x];
      }
  }
  $matrix = $newMatrix;
}
=cut

sub initMatrix(){
  my $counter = 0;

  foreach my $y (0...($size - 1)){
      foreach my $x (0...($size - 1)){
        $matrix->[$y][$x] = $counter++;
      }
  }

}
sub printMatrix(){
   foreach my $y (0...($size - 1)){
      foreach my $x (0...($size - 1)){
        print "[".$matrix->[$y][$x]."]";
      }
      print "\n";
  }
  print "\n";
   
}


