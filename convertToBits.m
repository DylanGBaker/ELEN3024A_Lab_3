function bits = convertToBits(symbol)
possible_symbols = [4000 + 4000i 8000 + 0i -8000 + 0i -4000 + 4000i 4000 - 4000i 0 + 0i 0 + 8000i 0 - 8000i];
distance_between_each_symbol = [0 0 0 0 0 0 0 0];

for i = 1:length(possible_symbols)
    real_distance = real(symbol) - real(possible_symbols(i));
    imag_distance = imag(symbol) - imag(possible_symbols(i));

    distance = sqrt((real_distance * real_distance) + (imag_distance * imag_distance));
    distance_between_each_symbol(i) = distance;
end

min_calculated_distance = min(distance_between_each_symbol);

for i = 1:length(distance_between_each_symbol)
    if (distance_between_each_symbol(i) == min_calculated_distance)
        demodulated_symbol_pos = i;
        break;
    end
end


demodulated_symbol = possible_symbols(demodulated_symbol_pos);

if(isequal(demodulated_symbol, possible_symbols(1)))
    bits = [0 0 0];
elseif(isequal(demodulated_symbol, possible_symbols(2)))
    bits = [0 0 1];
elseif(isequal(demodulated_symbol, possible_symbols(3)))
    bits = [0 1 0];
elseif(isequal(demodulated_symbol, possible_symbols(4)))
    bits = [1 0 0];
elseif(isequal(demodulated_symbol, possible_symbols(5)))
    bits = [0 1 1];
elseif(isequal(demodulated_symbol, possible_symbols(6)))
    bits = [1 0 1];
elseif(isequal(demodulated_symbol, possible_symbols(7)))
    bits = [1 1 0];
elseif(isequal(demodulated_symbol, possible_symbols(8)))
    bits = [1 1 1];

end