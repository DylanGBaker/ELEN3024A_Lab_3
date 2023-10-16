%This script implements Question one

data_rate = 3 * 10^6; 
number_of_symbols = data_rate/3; %Get number of symbols based on data rate.
bits = generateBitArray(data_rate); %Create 3 million bits

%Convert transmitted bits into symbol mappings I made.
Tx = convertBitsToSymbols(bits); 
count  = 1;

for i = -5:1:18
    %Generate Noise according SNR value from for loop.
    noise_array = awgn(Tx, i, "measured"); 
    Rx_with_noise = Tx + noise_array;

    snr_array(count) = i;
    
    demodulated_symbols = convertSymbolsToBits(Rx_with_noise);
    error = compareDemodulatedSymbolBits(bits, demodulated_symbols);

    %Need to divide by the number of symbols to get the 
    %symbol error rate.
    error_probability(count) = error/number_of_symbols;

    count  = count + 1;
end

semilogy(snr_array, error_probability);
xlabel("Eb/No, dB");
ylabel("Pm, Probability of symbol error")
grid on
