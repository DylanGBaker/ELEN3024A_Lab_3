function number_of_errors = compareDemodulatedBits(mod_bits, demod_bits)

number_of_errors = 0;

for i = 1:length(mod_bits)
    if (~isequal(mod_bits(i), demod_bits(i)))
        number_of_errors = number_of_errors + 1;
    end
end
end