function [g_extmb] = extnd_mbd(a,b,min_fre_diff,win_N)

if nargin == 3
    win_N = 128;
end
if nargin == 2
    win_N = 128; min_fre_diff = 0.5;
end

G_mb_Dopper = zeros(win_N,win_N); 
for n = -win_N/2:win_N/2
    G_mb_Dopper(:,mod(n,win_N)+1) = cosh( n ).^( -2 * a );
end
tmp1 = fft(G_mb_Dopper(1,:));
G_mb_Dopper = G_mb_Dopper./tmp1(1);
g_mb_Dopper = real(fft(G_mb_Dopper.').');

G_mb_lag = zeros(win_N,win_N); 
for n = -win_N/2:win_N/2
    G_mb_lag(:,mod(n,win_N)+1) = cosh( n ).^( -2 * b );
end
tmp1 = fft(G_mb_lag(1,:));
G_mb_lag = G_mb_lag./tmp1(1);
g_mb_lag = real(fft(G_mb_lag.').');

effective_win = floor(min_fre_diff*win_N);
g_extmb = g_mb_lag.'.*g_mb_Dopper;
tmp = -win_N/2:win_N/2-1;
g_extmb(:,abs(tmp) <= (win_N/2-effective_win)) = 0;


