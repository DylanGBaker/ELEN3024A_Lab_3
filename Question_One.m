

data_rate = 3 * 10^6;
number_of_symbols = data_rate/3;
bits = generateBitArray(data_rate);

Tx = convertBitsToSymbols(bits);
count  = 1;

for i = -5:1:15
    noise_array = awgn(Tx, i, "measured");
    Rx_with_noise = Tx + noise_array;
    snr_array(count) = i;
    demodulated_symbols = convertSymbolsToBits(Rx_with_noise);
    error = compareDemodulatedSymbolBits(bits, demodulated_symbols);
    error_probability(count) = error/number_of_symbols;
    count  = count + 1;
end

semilogy(snr_array, error_probability);

