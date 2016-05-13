function y = flicker( size )
% The function generates a sequence of pink (flicker) noise samples. 
% INPUT:
% size - number of samples to be returned
% OUTPUT:
% vector of pink (flicer) noise samples
%
% Note:
% Use on your risk.

%calculate the size for fft. The size should be a power of 2. If not, its
%expanded
size2 = ceil( log2( size ));
size2 = 2^size2;

x = randn( 1, size2 );

% calculate fft and then perform 1/f multiplication
f = fft( x );

% prepare a vector for 1/f multiplication
n = 1:(size2/2+1);
n = sqrt( n );

% multiplicate the left half of the fft
f(1:size2/2+1)=f(1:size2/2+1)./n;

f(size2/2+2:size2) = real( f(size2/2:-1:2)) -i*imag(f(size2/2:-1:2));

y = ifft( f );
y = real( y(1:size) );
