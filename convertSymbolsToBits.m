function bits = convertSymbolsToBits(symbols)

for i = 1:length(symbols)
    tempBits{i} = convertToBits(symbols(i));
end

count = 1;

%Have to convert the bits cell array into a normal array to compare to the
%transmitted bits.
for i = 1:length(tempBits)
    tempArray = tempBits{i};
    for j = 1:3
        bits(count) = tempArray(j);
        count = count + 1;
    end
end
end