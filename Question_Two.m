

data_rate = 3 * 10^6;
bits = generateBitArray(data_rate);

Tx = convertBitsToSymbols(bits);
count  = 1;

for i = -5:1:17
    noise_array = awgn(Tx, i, "measured");
    Rx_with_noise = Tx + noise_array;
    snr_array(count) = i;
    demodulated_bits = convertSymbolsToBits(Rx_with_noise);
    error = compareDemodulatedBits(bits, demodulated_bits);
    error_probability(count) = error/data_rate;
    count  = count + 1;
end

semilogy(snr_array, error_probability);
xlabel("Eb/No dB");
ylabel("Pm, Probability of symbol error")