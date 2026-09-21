clc;
clear;
close all;

%% Đọc dữ liệu CSV
data = readtable('robot_data.csv');

%% Lấy dữ liệu
t = data{:, 'Time_s_'};

Xd_x = data{:, 'X_d_x_m_'};
Xe_x = data{:, 'X_e_x_m_'};

Xd_y = data{:, 'X_d_y_m_'};
Xe_y = data{:, 'X_e_y_m_'};

Xd_z = data{:, 'X_d_z_m_'};
Xe_z = data{:, 'X_e_z_m_'};

Xd_roll  = data{:, 'X_d_roll_rad_'};
Xe_roll  = data{:, 'X_e_roll_rad_'};

Xd_pitch = data{:, 'X_d_pitch_rad_'};
Xe_pitch = data{:, 'X_e_pitch_rad_'};

Xd_yaw   = data{:, 'X_d_yaw_rad_'};
Xe_yaw   = data{:, 'X_e_yaw_rad_'};

%% Vẽ figure
figure('Name', 'Trajectory Tracking', 'NumberTitle', 'off');

%% X
subplot(3,2,1);
plot(t, Xd_x, 'LineWidth', 1.5);
hold on;
plot(t, Xe_x, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('X (m)');
title('X Position');
legend('X_d', 'X_e');

%% Y
subplot(3,2,2);
plot(t, Xd_y, 'LineWidth', 1.5);
hold on;
plot(t, Xe_y, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Y (m)');
title('Y Position');
legend('Y_d', 'Y_e');

%% Z
subplot(3,2,3);
plot(t, Xd_z, 'LineWidth', 1.5);
hold on;
plot(t, Xe_z, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Z (m)');
title('Z Position');
legend('Z_d', 'Z_e');

%% Roll
subplot(3,2,4);
plot(t, Xd_roll, 'LineWidth', 1.5);
hold on;
plot(t, Xe_roll, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Roll (rad)');
title('Roll Angle');
legend('Roll_d', 'Roll_e');

%% Pitch
subplot(3,2,5);
plot(t, Xd_pitch, 'LineWidth', 1.5);
hold on;
plot(t, Xe_pitch, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Pitch (rad)');
title('Pitch Angle');
legend('Pitch_d', 'Pitch_e');

%% Yaw
subplot(3,2,6);
plot(t, Xd_yaw, 'LineWidth', 1.5);
hold on;
plot(t, Xe_yaw, '--', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Yaw (rad)');
title('Yaw Angle');
legend('Yaw_d', 'Yaw_e');

%% Tiêu đề tổng
sgtitle('Desired vs Actual End-Effector Trajectory');