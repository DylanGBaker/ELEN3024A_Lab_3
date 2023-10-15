

data_rate = 3 * 10^6;
bits = generateBitArray(data_rate);

Tx = convertBitsToSymbols(bits);

% SNR_zero = awgn(Tx, 0, "measured");
% SNR_two = awgn(Tx, 2, "measured");
% SNR_five = awgn(Tx, 5, "measured");
% SNR_eight = awgn(Tx, 8, "measured");
% SNR_twelve = awgn(Tx, 12, "measured");
count  = 1;

for i = -4:0.5:15
    noise_array = awgn(Tx, i, "measured");
    Rx_with_noise = Tx + noise_array;
    snr_array(count) = i;
    demodulated_symbols = convertSymbolsToBits(Rx_with_noise);
    error = compareDemodulatedSymbolBits(bits, demodulated_symbols);
    error_probability(count) = error/data_rate;
    count  = count + 1;
end

% Rx_zero = Tx + SNR_zero;
% Rx_two = Tx + SNR_two;
% Rx_five = Tx + SNR_five;
% Rx_eight = Tx + SNR_eight;
% Rx_twelve = Tx + SNR_twelve;
% 
% SNR_array = [0 2 5 8 12];
% 
% demodulated_symbols_zero = convertSymbolsToBits(Rx_zero);
% demodulated_symbols_two = convertSymbolsToBits(Rx_two);
% demodulated_symbols_five = convertSymbolsToBits(Rx_five);
% demodulated_symbols_eight = convertSymbolsToBits(Rx_eight);
% demodulated_symbols_twelve = convertSymbolsToBits(Rx_twelve);
% 
% number_of_errors_zero = compareDemodulatedSymbolBits(bits, demodulated_symbols_zero);
% number_of_errors_two = compareDemodulatedSymbolBits(bits, demodulated_symbols_two);
% number_of_errors_five = compareDemodulatedSymbolBits(bits, demodulated_symbols_five);
% number_of_errors_eight = compareDemodulatedSymbolBits(bits, demodulated_symbols_eight);
% number_of_errors_twelve = compareDemodulatedSymbolBits(bits, demodulated_symbols_twelve);

%error_array = [number_of_errors_zero/data_rate number_of_errors_two/data_rate number_of_errors_five/data_rate number_of_errors_eight/data_rate number_of_errors_twelve/data_rate];


plot(snr_array, error_probability);


