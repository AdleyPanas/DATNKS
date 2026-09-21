clc;
clear;
close all;

%% Read data
data = readtable('5smc.csv');

%% Time
t = data.Time_s_;

%% Reference + response (SMC)
Xd_x = data.X_d_x_m_;
Xd_y = data.X_d_y_m_;
Xd_z = data.X_d_z_m_;

Xe_x = data.X_e_x_m_;
Xe_y = data.X_e_y_m_;
Xe_z = data.X_e_z_m_;

%% Trim safety
N = length(t);
t = t(1:N);

Xd_x = Xd_x(1:N); Xe_x = Xe_x(1:N);
Xd_y = Xd_y(1:N); Xe_y = Xe_y(1:N);
Xd_z = Xd_z(1:N); Xe_z = Xe_z(1:N);

%% ===== Figure =====
figure;

% ===== X =====
subplot(3,1,1)
grid on; hold on;
xlim([t(1) t(end)]);   % 🔥 cố định trục thời gian
ylim([min([Xd_x;Xe_x]) max([Xd_x;Xe_x])]);

h1 = plot(nan,nan,'r','LineWidth',1.5);
h2 = plot(nan,nan,'k--','LineWidth',1.2);
legend('SMC','Ref');

title('x position');

% ===== Y =====
subplot(3,1,2)
grid on; hold on;
xlim([t(1) t(end)]);
ylim([min([Xd_y;Xe_y]) max([Xd_y;Xe_y])]);

h3 = plot(nan,nan,'r','LineWidth',1.5);
h4 = plot(nan,nan,'k--','LineWidth',1.2);
title('y position');

% ===== Z =====
subplot(3,1,3)
grid on; hold on;
xlim([t(1) t(end)]);
ylim([min([Xd_z;Xe_z]) max([Xd_z;Xe_z])]);

h5 = plot(nan,nan,'r','LineWidth',1.5);
h6 = plot(nan,nan,'k--','LineWidth',1.2);
title('z position');

%% ===== Animation loop =====
for k = 1:N

    set(h1,'XData',t(1:k),'YData',Xe_x(1:k));
    set(h2,'XData',t(1:k),'YData',Xd_x(1:k));

    set(h3,'XData',t(1:k),'YData',Xe_y(1:k));
    set(h4,'XData',t(1:k),'YData',Xd_y(1:k));

    set(h5,'XData',t(1:k),'YData',Xe_z(1:k));
    set(h6,'XData',t(1:k),'YData',Xd_z(1:k));

    drawnow;
end