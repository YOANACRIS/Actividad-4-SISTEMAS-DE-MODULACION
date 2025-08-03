
% MODULACIÓN EN AMPLITUD (AM)
% Implementado en MATLAB
% Yoana Castillo - Agosto 2025

clear; clc; close all;

%% 1. Parámetros básicos
fs = 10000;             % Frecuencia de muestreo (Hz)
t = 0:1/fs:0.1;         % Vector de tiempo (0 a 0.1 segundos)

%% 2. Señal de mensaje (baja frecuencia)
fm = 100;               % Frecuencia de la señal mensaje (Hz)
Am = 1;                 % Amplitud de la señal mensaje
m = Am*sin(2*pi*fm*t);  % Señal del mensaje

figure;
plot(t, m);
title('Señal de mensaje');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

%% 3. Señal portadora (alta frecuencia)
fc = 1000;              % Frecuencia de la portadora (Hz)
Ac = 2;                 % Amplitud de la portadora
c = Ac*sin(2*pi*fc*t);  % Señal portadora

%% 4. Modulación en amplitud
modulada = (1 + m).*c;  % AM con modulación DSB-TC

figure;
plot(t, modulada);
title('Señal Modulada (AM)');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

%% 5. Análisis en frecuencia
n = length(modulada);
f = (-n/2:n/2-1)*(fs/n);
Modulada_FFT = fftshift(abs(fft(modulada))/n);

figure;
plot(f, Modulada_FFT);
title('Espectro de la señal modulada');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

%% 6. Introducción de ruido
ruido = 0.3*randn(size(modulada));  % Ruido blanco gaussiano
modulada_ruido = modulada + ruido;

figure;
plot(t, modulada_ruido);
title('Señal Modulada con Ruido');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

%% 7. Simulación de atenuación
modulada_atenuada = 0.5 * modulada;

figure;
plot(t, modulada_atenuada);
title('Señal Modulada Atenuada');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

%% 8. Simulación de distorsión (no linealidad)
modulada_distorsion = modulada + 0.1*modulada.^2;

figure;
plot(t, modulada_distorsion);
title('Señal Modulada con Distorsión');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

%% 9. Conclusión (comentario en código)
% Se observa cómo la señal modulada en AM cambia ante diferentes condiciones:
% - El ruido distorsiona la envolvente.
% - La atenuación reduce la amplitud general.
% - La distorsión no lineal introduce nuevas componentes no deseadas.
