function symbolArray = convertBitsToSymbols(bitArray)

%This function loops through the bit array generated and looks at three
%bits and converts them to a symbol that I decided on based on the
%coordinate space made for the practical.

tempArray = [0 0 0];
symbolArrayIndex = 1;
count = 1;

for i = 1: length(bitArray)
    if (count < 3)
        tempArray(count) = bitArray(i);
        count = count + 1;
    elseif (count == 3)
        tempArray(count) = bitArray(i);

        %This function takes in an array of three bits and checks which 
        %symbol it corresponds to. The logic can be seen in the
        %convertToSymbol.m file.
        symbol = convertToSymbol(tempArray);

        symbolArray(symbolArrayIndex) = symbol;

        symbolArrayIndex = symbolArrayIndex + 1;
        count = 1;
    end   
end
end