clc;
clear;
close all;

%% Đọc dữ liệu CSV
data = readtable('robot_data.csv');

%% Time
t = data{:, 'Time_s_'};

%% ===================== X =====================
figure('Name', 'X Position');

plot(t, data{:, 'X_d_x_m_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_x_m_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('X (m)');
title('X Position Tracking');
legend('X_d', 'X_e');

%% ===================== Y =====================
figure('Name', 'Y Position');

plot(t, data{:, 'X_d_y_m_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_y_m_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Y (m)');
title('Y Position Tracking');
legend('Y_d', 'Y_e');

%% ===================== Z =====================
figure('Name', 'Z Position');

plot(t, data{:, 'X_d_z_m_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_z_m_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Z (m)');
title('Z Position Tracking');
legend('Z_d', 'Z_e');

%% ===================== Roll =====================
figure('Name', 'Roll Angle');

plot(t, data{:, 'X_d_roll_rad_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_roll_rad_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Roll (rad)');
title('Roll Tracking');
legend('Roll_d', 'Roll_e');

%% ===================== Pitch =====================
figure('Name', 'Pitch Angle');

plot(t, data{:, 'X_d_pitch_rad_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_pitch_rad_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Pitch (rad)');
title('Pitch Tracking');
legend('Pitch_d', 'Pitch_e');

%% ===================== Yaw =====================
figure('Name', 'Yaw Angle');

plot(t, data{:, 'X_d_yaw_rad_'}, 'LineWidth', 1.5);
hold on;
plot(t, data{:, 'X_e_yaw_rad_'}, '--', 'LineWidth', 1.5);

grid on;
xlabel('Time (s)');
ylabel('Yaw (rad)');
title('Yaw Tracking');
legend('Yaw_d', 'Yaw_e');