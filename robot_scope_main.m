%clc;
clear;
close all;

%% Read data
data = readtable('robot_data.csv');
data2 = readtable('robot_data.csv');
%% Time
t_p = data.Time_s_;
t_smc = data2.Time_s_;
N = min(length(t_p), length(t_smc));
t = t_p(1:N);

%% Tracking data
Xd_x = data.X_d_x_m_;
Xe_x = data.X_e_x_m_;
Xd_y = data.X_d_y_m_;
Xe_y = data.X_e_y_m_;
Xd_z = data.X_d_z_m_;
Xe_z = data.X_e_z_m_;

Xd_x = Xd_x(1:N);
Xd_y = Xd_y(1:N);
Xd_z = Xd_z(1:N);
Xe_x = Xe_x(1:N);
Xe_y = Xe_y(1:N);
Xe_z = Xe_z(1:N);

Xe_x_smc = data2.X_e_x_m_;
Xe_y_smc = data2.X_e_y_m_;
Xe_z_smc = data2.X_e_z_m_;
Xe_x_smc = Xe_x_smc(1:N);
Xe_y_smc = Xe_y_smc(1:N);
Xe_z_smc = Xe_z_smc(1:N);
%% Position errors in world frame {S}
Ex_p = Xd_x - Xe_x;
Ey_p = Xd_y - Xe_y;
Ez_p = Xd_z - Xe_z;
Ex_p = Ex_p(1:N);
Ey_p = Ey_p(1:N);
Ez_p = Ez_p(1:N);
ep_p = sqrt(Ex_p.^2 + Ey_p.^2 + Ez_p.^2);
rmse_ep_p    = sqrt(mean(ep_p.^2));

Ex_smc = Xd_x - Xe_x_smc;
Ey_smc = Xd_y - Xe_y_smc;
Ez_smc = Xd_z - Xe_z_smc;
Ex_smc = Ex_smc(1:N);
Ey_smc = Ey_smc(1:N);
Ez_smc = Ez_smc(1:N);
ep_smc = sqrt(Ex_smc.^2 + Ey_smc.^2 + Ez_smc.^2);
rmse_ep_smc    = sqrt(mean(ep_smc.^2));
%% Orientation errors
Xerr_roll  = data.Xerr_roll_rad_;
Xerr_pitch = data.Xerr_pitch_rad_;
Xerr_yaw   = data.Xerr_yaw_rad_;
Xerr_roll = Xerr_roll(1:N);
Xerr_pitch = Xerr_pitch(1:N);
Xerr_yaw = Xerr_yaw(1:N);

rmse_roll_p  = sqrt(mean(Xerr_roll.^2));
rmse_pitch_p = sqrt(mean(Xerr_pitch.^2));
rmse_yaw_p   = sqrt(mean(Xerr_yaw.^2));


%% SMC

Xerr_roll_smc  = data2.Xerr_roll_rad_;
Xerr_pitch_smc = data2.Xerr_pitch_rad_;
Xerr_yaw_smc   = data2.Xerr_yaw_rad_;
Xerr_roll_smc = Xerr_roll_smc(1:N);
Xerr_pitch_smc = Xerr_pitch_smc(1:N);
Xerr_yaw_smc = Xerr_yaw_smc(1:N);

rmse_roll_smc  = sqrt(mean(Xerr_roll_smc.^2));
rmse_pitch_smc = sqrt(mean(Xerr_pitch_smc.^2));
rmse_yaw_smc   = sqrt(mean(Xerr_yaw_smc.^2));

%% q_dot
qd1p = data.qdot1;
qd2p = data.qdot2;
qd3p = data.qdot3;
qd4p = data.qdot4;
qd5p = data.qdot5;
qd6p = data.qdot6;
qd7p = data.qdot7;
qd8p = data.qdot8;
qd9p = data.qdot9;
qd1p = qd1p(1:N);
qd2p = qd2p(1:N);
qd3p = qd3p(1:N);
qd4p = qd4p(1:N);
qd5p = qd5p(1:N);
qd6p = qd6p(1:N);
qd7p = qd7p(1:N);
qd8p = qd8p(1:N);
qd9p = qd9p(1:N);


qd1smc = data2.qdot1;
qd2smc = data2.qdot2;
qd3smc = data2.qdot3;
qd4smc = data2.qdot4;
qd5smc = data2.qdot5;
qd6smc = data2.qdot6;
qd7smc = data2.qdot7;
qd8smc = data2.qdot8;
qd9smc = data2.qdot9;
qd1smc = qd1smc(1:N);
qd2smc = qd2smc(1:N);
qd3smc = qd3smc(1:N);
qd4smc = qd4smc(1:N);
qd5smc = qd5smc(1:N);
qd6smc = qd6smc(1:N);
qd7smc = qd7smc(1:N);
qd8smc = qd8smc(1:N);
qd9smc = qd9smc(1:N);

%%vi tri khop
teta1p = data.theta1_rad_;
teta2p = data.theta2_rad_;
teta3p = data.theta3_rad_;
teta4p = data.theta4_rad_;
teta5p = data.theta5_rad_;
teta1p = teta1p(1:N);
teta2p = teta2p(1:N);
teta3p = teta3p(1:N);
teta4p = teta4p(1:N);
teta5p = teta5p(1:N);

teta1smc = data2.theta1_rad_;
teta2smc = data2.theta2_rad_;
teta3smc = data2.theta3_rad_;
teta4smc = data2.theta4_rad_;
teta5smc = data2.theta5_rad_;
teta1smc = teta1smc(1:N);
teta2smc = teta2smc(1:N);
teta3smc = teta3smc(1:N);
teta4smc = teta4smc(1:N);
teta5smc = teta5smc(1:N);
%%
figure('Name','Kết quả bám quỹ đạo trong hệ tọa độ cố định',...
       'NumberTitle','off',...
       'Color','w');

subplot(1,3,1)
plot(t,Xd_x,'k--','LineWidth',1.5)
hold on
plot(t,Xe_x,'b','LineWidth',1.5)
plot(t,Xe_x_smc,'r','LineWidth',1.5)
grid on
title('Vị trí theo trục X')
xlabel('Thời gian (s)')
ylabel('x (m)')
legend('Giá trị đặt','P','SMC',...
       'Location','best')

subplot(1,3,2)
plot(t,Xd_y,'k--','LineWidth',1.5)
hold on
plot(t,Xe_y,'b','LineWidth',1.5)
plot(t,Xe_y_smc,'r','LineWidth',1.5)
grid on
title('Vị trí theo trục Y')
xlabel('Thời gian (s)')
ylabel('y (m)')
legend('Giá trị đặt','P','SMC',...
       'Location','best')

subplot(1,3,3)
plot(t,Xd_z,'k--','LineWidth',1.5)
hold on
plot(t,Xe_z,'b','LineWidth',1.5)
plot(t,Xe_z_smc,'r','LineWidth',1.5)
grid on
title('Vị trí theo trục Z')
xlabel('Thời gian (s)')
ylabel('z (m)')
legend('Giá trị đặt','P','SMC',...
       'Location','best')



% sgtitle('Kết quả bám quỹ đạo trong hệ tọa độ cố định',...
%         'FontWeight','bold',...
%         'FontSize',14)
%%
figure('Name','Sai lệch góc trong hệ tọa độ tay kẹp',...
       'NumberTitle','off',...
       'Color','w');
subplot(2,3,1)
plot(t,Ex_p,'b','LineWidth',1.5)
hold on
plot(t,Ex_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch theo trục X')
xlabel('Thời gian (s)')
ylabel('e_x (m)')
legend('P','SMC','Location','best')

subplot(2,3,2)
plot(t,Ey_p,'b','LineWidth',1.5)
hold on
plot(t,Ey_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch theo trục Y')
xlabel('Thời gian (s)')
ylabel('e_y (m)')
legend('P','SMC','Location','best')

subplot(2,3,3)
plot(t,Ez_p,'b','LineWidth',1.5)
hold on
plot(t,Ez_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch theo trục Z')
xlabel('Thời gian (s)')
ylabel('e_z (m)')
legend('P','SMC','Location','best')
subplot(2,3,4)
plot(t,Xerr_roll,'b-.','LineWidth',1.5)
hold on
plot(t,Xerr_roll_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch Roll')
xlabel('Thời gian (s)')
ylabel('e_{\phi x} (rad)')
legend('P','SMC','Location','best')

subplot(2,3,5)
plot(t,Xerr_pitch,'b-.','LineWidth',1.5)
hold on
plot(t,Xerr_pitch_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch Pitch')
xlabel('Thời gian (s)')
ylabel('e_{\phi y} (rad)')
legend('P','SMC','Location','best')

subplot(2,3,6)
plot(t,Xerr_yaw,'b-.','LineWidth',1.5)
hold on
plot(t,Xerr_yaw_smc,'r','LineWidth',1.5)
grid on
title('Sai lệch Yaw')
xlabel('Thời gian (s)')
ylabel('e_{\phi z} (rad)')
legend('P','SMC','Location','best')

% sgtitle('Sai lệch góc trong hệ tọa độ tay kẹp',...
%         'FontWeight','bold',...
%         'FontSize',14)

%%
figure('Name','Sai lệch vị trí tuyệt đối',...
       'NumberTitle','off',...
       'Color','w');

plot(t,ep_p,'b','LineWidth',2)
hold on
plot(t,ep_smc,'r','LineWidth',2)

grid on
xlabel('Thời gian (s)')
ylabel('e_p (m)')
% title('Sai lệch vị trí tuyệt đối')

legend( ...
    sprintf('P'), ...
    sprintf('SMC'), ...
    'Location','best')
%%
fprintf('\n========== RMSE BO DIEU KHIEN P ==========\n');
fprintf('Roll               : %.8f rad\n', rmse_roll_p);
fprintf('Pitch              : %.8f rad\n', rmse_pitch_p);
fprintf('Yaw                : %.8f rad\n', rmse_yaw_p);
fprintf('Sai lech vi tri ep : %.8f m\n', rmse_ep_p);

fprintf('\n========== RMSE BO DIEU KHIEN SMC ==========\n');
fprintf('Roll               : %.8f rad\n', rmse_roll_smc);
fprintf('Pitch              : %.8f rad\n', rmse_pitch_smc);
fprintf('Yaw                : %.8f rad\n', rmse_yaw_smc);
fprintf('Sai lech vi tri ep : %.8f m\n', rmse_ep_smc);

%% linh tinh
improve_ep = ...
    (rmse_ep_p - rmse_ep_smc)/rmse_ep_p*100;

fprintf('\nMuc giam RMSE vi tri cua SMC so voi P: %.2f %%\n', ...
        improve_ep);
improve_roll  = (rmse_roll_p  - rmse_roll_smc )/rmse_roll_p *100;
improve_pitch = (rmse_pitch_p - rmse_pitch_smc)/rmse_pitch_p*100;
improve_yaw   = (rmse_yaw_p   - rmse_yaw_smc  )/rmse_yaw_p  *100;
fprintf('\n========== TY LE CAI THIEN CUA SMC ==========\n');
fprintf('Roll  : %.2f %%\n', improve_roll);
fprintf('Pitch : %.2f %%\n', improve_pitch);
fprintf('Yaw   : %.2f %%\n', improve_yaw);
fprintf('ep    : %.2f %%\n', improve_ep);

%%ve qdot
%% Figure q_dot
figure('Name','So sanh tin hieu dieu khien q_dot',...
       'NumberTitle','off',...
       'Color','w');

%% 4 wheel velocities
subplot(2,1,1)

h1 = plot(t,qd1p,'b--','LineWidth',1.5);
hold on
h2 = plot(t,qd1smc,'b','LineWidth',1.5);

h3 = plot(t,qd2p,'r--','LineWidth',1.5);
h4 = plot(t,qd2smc,'r','LineWidth',1.5);

h5 = plot(t,qd3p,'g--','LineWidth',1.5);
h6 = plot(t,qd3smc,'g','LineWidth',1.5);

h7 = plot(t,qd4p,'m--','LineWidth',1.5);
h8 = plot(t,qd4smc,'m','LineWidth',1.5);

grid on
title('Vận tốc điều khiển các bánh xe')
xlabel('Thời gian (s)')
ylabel('$v$ (m/s)','Interpreter','latex')

legend([h1 h3 h5 h7 h2 h4 h6 h8], ...
    '$v_1$ (P)', '$v_2$ (P)', '$v_3$ (P)', '$v_4$ (P)', ...
    '$v_1$ (SMC)', '$v_2$ (SMC)', '$v_3$ (SMC)', '$v_4$ (SMC)', ...
    'Interpreter','latex', ...
    'NumColumns',2, ...
    'Location','bestoutside');

%% 5 arm joint velocities
subplot(2,1,2)

h1 = plot(t,qd5p,'b--','LineWidth',1.5);
hold on
h2 = plot(t,qd5smc,'b','LineWidth',1.5);

h3 = plot(t,qd6p,'r--','LineWidth',1.5);
h4 = plot(t,qd6smc,'r','LineWidth',1.5);

h5 = plot(t,qd7p,'g--','LineWidth',1.5);
h6 = plot(t,qd7smc,'g','LineWidth',1.5);

h7 = plot(t,qd8p,'m--','LineWidth',1.5);
h8 = plot(t,qd8smc,'m','LineWidth',1.5);

h9  = plot(t,qd9p,'k--','LineWidth',1.5);
h10 = plot(t,qd9smc,'k','LineWidth',1.5);

grid on
title('Vận tốc điều khiển các khớp tay máy')
xlabel('Thời gian (s)')
ylabel('$\dot{\theta}$ (rad/s)','Interpreter','latex')

legend([h1 h3 h5 h7 h9 h2 h4 h6 h8 h10], ...
    '$\dot{\theta}_1$ (P)', ...
    '$\dot{\theta}_2$ (P)', ...
    '$\dot{\theta}_3$ (P)', ...
    '$\dot{\theta}_4$ (P)', ...
    '$\dot{\theta}_5$ (P)', ...
    '$\dot{\theta}_1$ (SMC)', ...
    '$\dot{\theta}_2$ (SMC)', ...
    '$\dot{\theta}_3$ (SMC)', ...
    '$\dot{\theta}_4$ (SMC)', ...
    '$\dot{\theta}_5$ (SMC)', ...
    'Interpreter','latex', ...
    'NumColumns',2, ...
    'Location','bestoutside');

%% Vi tri 5 khop
figure('Name','Vị trí các khớp tay máy',...
       'NumberTitle','off',...
       'Color','w');

h1 = plot(t,teta1p,'b--','LineWidth',1.5);
hold on
h2 = plot(t,teta1smc,'b','LineWidth',1.5);

h3 = plot(t,teta2p,'r--','LineWidth',1.5);
h4 = plot(t,teta2smc,'r','LineWidth',1.5);

h5 = plot(t,teta3p,'g--','LineWidth',1.5);
h6 = plot(t,teta3smc,'g','LineWidth',1.5);

h7 = plot(t,teta4p,'m--','LineWidth',1.5);
h8 = plot(t,teta4smc,'m','LineWidth',1.5);

h9  = plot(t,teta5p,'k--','LineWidth',1.5);
h10 = plot(t,teta5smc,'k','LineWidth',1.5);

grid on
%title('Vị trí các khớp tay máy')
xlabel('Thời gian (s)')
ylabel('$\theta_i\;(\mathrm{rad})$', ...
       'Interpreter','latex')

legend([h1 h3 h5 h7 h9 h2 h4 h6 h8 h10], ...
    '$\theta_1$ (P)', ...
    '$\theta_2$ (P)', ...
    '$\theta_3$ (P)', ...
    '$\theta_4$ (P)', ...
    '$\theta_5$ (P)', ...
    '$\theta_1$ (SMC)', ...
    '$\theta_2$ (SMC)', ...
    '$\theta_3$ (SMC)', ...
    '$\theta_4$ (SMC)', ...
    '$\theta_5$ (SMC)', ...
    'Interpreter','latex', ...
    'NumColumns',2, ...
    'Location','bestoutside');
%%
[max_ep_p, idx_p] = max(ep_p);
[max_ep_smc, idx_smc] = max(ep_smc);

fprintf('\n========== SAI LECH VI TRI CUC DAI ==========\n');
fprintf('P   : %.8f m (t = %.3f s)\n', max_ep_p, t(idx_p));
fprintf('SMC : %.8f m (t = %.3f s)\n', max_ep_smc, t(idx_smc));