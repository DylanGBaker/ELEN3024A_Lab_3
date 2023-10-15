function allWhiteGaussianNoise = generateNoise(symbols)
allWhiteGaussianNoise = awgn(symbols, 5, 'measured');
end