%clc;
clear;
close all;

%% Read data
data = readtable('robot_data3.csv');

%% Time
t = data.Time_s_;

%% Tracking data
Xd_x = data.X_d_x_m_;
Xe_x = data.X_e_x_m_;

Xd_y = data.X_d_y_m_;
Xe_y = data.X_e_y_m_;

Xd_z = data.X_d_z_m_;
Xe_z = data.X_e_z_m_;

%% Position errors in world frame {S}
Ex_world = Xd_x - Xe_x;
Ey_world = Xd_y - Xe_y;
Ez_world = Xd_z - Xe_z;

ep_world = sqrt(Ex_world.^2 + Ey_world.^2 + Ez_world.^2);
rmse_ep_world = sqrt(mean(ep_world.^2));

%% Orientation errors
Xerr_roll  = data.Xerr_roll_rad_;
Xerr_pitch = data.Xerr_pitch_rad_;
Xerr_yaw   = data.Xerr_yaw_rad_;
rmse_roll  = sqrt(mean(Xerr_roll.^2));
rmse_pitch = sqrt(mean(Xerr_pitch.^2));
rmse_yaw   = sqrt(mean(Xerr_yaw.^2));
%% Position errors
Xerr_x = data.Xerr_x_m_;
Xerr_y = data.Xerr_y_m_;
Xerr_z = data.Xerr_z_m_;
ep = sqrt(Xerr_x.^2 + Xerr_y.^2 + Xerr_z.^2);
rmse_ep = sqrt(mean(ep.^2));

% %% Khong gian khop
% theta1 = data.theta1_rad_*180/pi;
% theta2 = data.theta2_rad_*180/pi;
% theta3 = data.theta3_rad_*180/pi;
% theta4 = data.theta4_rad_*180/pi;
% theta5 = data.theta5_rad_*180/pi;
% velocity1 =  data.velocity1;
% velocity2 =  data.velocity2;
% velocity3 =  data.velocity3;
% velocity4 =  data.velocity4;
% velocity5 =  data.velocity5;



%% Figure
figure('Name','End-Effector Tracking Performance',...
       'NumberTitle','off',...
       'Color','w');

%% ===== Position Tracking =====
subplot(3,3,1)
plot(t,Xd_x,'LineWidth',1.5)
hold on
plot(t,Xe_x,'LineWidth',1.5)
grid on
title('X Position')
xlabel('Time (s)')
ylabel('Position (m)')
legend('Desired','Actual','Location','best')

subplot(3,3,2)
plot(t,Xd_y,'LineWidth',1.5)
hold on
plot(t,Xe_y,'LineWidth',1.5)
grid on
title('Y Position')
xlabel('Time (s)')
ylabel('Position (m)')
legend('Desired','Actual','Location','best')

subplot(3,3,3)
plot(t,Xd_z,'LineWidth',1.5)
hold on
plot(t,Xe_z,'LineWidth',1.5)
grid on
title('Z Position')
xlabel('Time (s)')
ylabel('Position (m)')
legend('Desired','Actual','Location','best')

%% ===== Orientation Errors =====
subplot(3,3,4)
plot(t,Xerr_roll,'LineWidth',1.5)
grid on
ylim([-0.05, 0.05])
title('Roll Error')
xlabel('Time (s)')
ylabel('Error (rad)')

subplot(3,3,5)
plot(t,Xerr_pitch,'LineWidth',1.5)
grid on
ylim([-0.05, 0.05])
title('Pitch Error')
xlabel('Time (s)')
ylabel('Error (rad)')

subplot(3,3,6)
plot(t,Xerr_yaw,'LineWidth',1.5)
grid on
ylim([-0.05, 0.05])
title('Yaw Error')
xlabel('Time (s)')
ylabel('Error (rad)')

%% ===== Position Errors =====
subplot(3,3,7)
plot(t,Xerr_x,'LineWidth',1.5)
grid on
ylim([-0.15, 0.05])
title('X Error')
xlabel('Time (s)')
ylabel('Error (m)')

subplot(3,3,8)
plot(t,Xerr_y,'LineWidth',1.5)
grid on
ylim([-0.1, 0.15])
title('Y Error')
xlabel('Time (s)')
ylabel('Error (m)')

subplot(3,3,9)
plot(t,Xerr_z,'LineWidth',1.5)
grid on
ylim([-0.05, 0.15])
title('Z Error')
xlabel('Time (s)')
ylabel('Error (m)')

sgtitle('End-Effector Trajectory Tracking Results',...
        'FontWeight','bold',...
        'FontSize',14)
%% ===== Absolute Position Error =====
figure('Name','Absolute Position Error',...
       'NumberTitle','off',...
       'Color','w');

plot(t,ep,'LineWidth',2)
grid on
xlabel('Time (s)')
ylabel('e_p (m)')
title('Absolute Position Error')

% Hiển thị giá trị lớn nhất và cuối cùng
ep_max = max(ep);
ep_final = ep(end);

legend(sprintf('Max = %.4f m, Final = %.4f m', ...
       ep_max, ep_final), ...
       'Location','best')

% %% ===== Joint Angles =====
% figure('Name','Joint Angles',...
%        'NumberTitle','off',...
%        'Color','w');
% 
% theta = {theta1,theta2,theta3,theta4,theta5};
% 
% for i = 1:5
%     subplot(3,2,i)
%     plot(t,theta{i},'LineWidth',1.5)
%     grid on
%     title(['\theta_' num2str(i)])
%     xlabel('Time (s)')
%     ylabel('độ')
% end
% 
% sgtitle('Joint Space Trajectory','FontWeight','bold')
% 
% %% ===== Joint Velocity =====
% figure('Name','Joint Velocity',...
%        'NumberTitle','off',...
%        'Color','w');
% 
% velocity = {velocity1,velocity2,velocity3,velocity4,velocity5};
% 
% for i = 1:5
%     subplot(3,2,i)
%     plot(t,velocity{i},'LineWidth',1.5)
%     grid on
%     title(['$\dot{\theta}_' num2str(i) '$'], ...
%       'Interpreter','latex')
%     xlabel('Time (s)')
%     ylabel('rad/s')
% end
% 
% sgtitle('Joint Velocity','FontWeight','bold')
%% Sai so trung binh binh phuong RMSE
fprintf('\n===== RMSE =====\n');
fprintf('Roll  : %.8f rad\n', rmse_roll);
fprintf('Pitch : %.8f rad\n', rmse_pitch);
fprintf('Yaw   : %.8f rad\n', rmse_yaw);
fprintf('Ep    : %.8e m\n', rmse_ep);