

data_rate = 3 * 10^6;
bits = generateBitArray(data_rate);

Tx = convertBitsToSymbols(bits);
count  = 1;

for i = -15:1:25
    noise_array = awgn(Tx, i, "measured");
    Rx_with_noise = Tx + noise_array;
    snr_array(count) = i;
    demodulated_symbols = convertSymbolsToBits(Rx_with_noise);
    error = compareDemodulatedSymbolBits(bits, demodulated_symbols);
    error_probability(count) = error/1000000;
    count  = count + 1;
end

plot(snr_array, error_probability);


