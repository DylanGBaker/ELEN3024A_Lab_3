function plotCoordinates()
symbols = [4000 + 4000i 8000 + 0i -8000 + 0i -4000 + 4000i 4000 - 4000i 0 + 0i 0 + 8000i 0 - 8000i];


scatter(real(symbols), imag(symbols), 'o', 'MarkerFaceColor', 'b');
grid on
end