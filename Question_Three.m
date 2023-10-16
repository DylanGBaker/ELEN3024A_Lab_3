%This script implements Question three

data_rate = 3 * 10^6;
bits = generateBitArray(data_rate);%Create 3 million bits

%Convert transmitted bits into symbol mappings I made.
Tx = convertBitsToSymbols(bits);
count  = 1;

for i = -5:1:18
    noise_array = awgn(Tx, i, "measured");
    Rx_with_noise = Tx + noise_array;

    snr_array(count) = i;

    demodulated_symbols = convertSymbolsToBits(Rx_with_noise);

    %Need to multiply by e^(i * pi/9) to introduce the phase shift.
    demodulated_symbols = demodulated_symbols * (exp(1i*(1/9 * pi)));
    error = compareDemodulatedSymbolBits(bits, demodulated_symbols);
    error_probability(count) = error/data_rate;

    count  = count + 1;
end

semilogy(snr_array, error_probability);
xlabel("Eb/No, dB");
ylabel("Pm, Probability of bit error")
grid on