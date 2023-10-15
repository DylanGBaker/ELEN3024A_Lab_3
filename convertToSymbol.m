function symbol = convertToSymbol(threeBitArray)
possibleBits = {[0 0 0] [0 0 1] [0 1 0] [1 0 0] [0 1 1] [1 0 1] [1 1 0] [1 1 1]};

if (isequal(threeBitArray, possibleBits{1}))
    symbol = 4000 + 4000i;
elseif (isequal(threeBitArray, possibleBits{2}))
    symbol = 8000 + 0i;
elseif (isequal(threeBitArray, possibleBits{3}))
    symbol = -8000 + 0i;
elseif (isequal(threeBitArray, possibleBits{4}))
    symbol = -4000 + 4000i;
elseif (isequal(threeBitArray, possibleBits{5}))
    symbol = 4000 - 4000i;
elseif (isequal(threeBitArray, possibleBits{6}))
    symbol = 0 + 0i;
elseif (isequal(threeBitArray, possibleBits{7}))
    symbol = 0 + 8000i;
elseif (isequal(threeBitArray, possibleBits{8}))
    symbol = 0 - 8000i;
end