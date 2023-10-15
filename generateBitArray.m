function bitArray = generateBitArray(number_of_bits)
%This function generates a random bit array according to the length of
%number_of_bits.

%The randi function will return double values so I cast it to integer
%types.
bitArray = int32(randi([0, 1], [1, number_of_bits]));
end