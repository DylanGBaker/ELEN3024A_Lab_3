function number_of_errors = compareDemodulatedSymbolBits(mod_bits,demod_bits)

number_of_errors = 0;
temp_mod_array = [0 0 0];
temp_demod_array = [0 0 0];

count = 1;
for i = 1:length(mod_bits)
    if (count < 3)
        temp_mod_array(count) = mod_bits(i);
        temp_demod_array(count) = demod_bits(i);
        count = count + 1;
    elseif (count == 3)
        temp_mod_array(count) = mod_bits(i);
        temp_demod_array(count) = demod_bits(i);

        if(~isequal(temp_demod_array, temp_mod_array))
            number_of_errors = number_of_errors + 1;
        end
    end
end
end