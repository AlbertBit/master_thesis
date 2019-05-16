clc

%input extraction
% input y_d, y_m, z_m
% output y_i, z,i

y_d = beam_measured_input(:,1:2);
y_m = beam_measured_input(:,3:4);
z_d = beam_measured_input(:,5:6);
z_m = beam_measured_input(:,7:8);
theta_m = beam_measured_input(:,9:10);

j_el_yd = extract_jacobian_element(X_out, y_d);
j_el_ym = extract_jacobian_element(X_out, y_m);
j_el_zd = extract_jacobian_element(X_out, z_d);
j_el_zm = extract_jacobian_element(X_out, z_m);
%j_el_theta_m = extract_jacobian_element(X_out, theta_m);

%j_el_ym = [1 0 1 0 1 0]';
%j_el_zm = [0 1 0 1 0 1]';

J = [j_el_yd, j_el_ym, j_el_zd, j_el_zm];

Jpinv = pinv(J);

xyz_0_left = xyz_rf_new_left(end,:); 
xyz_0_right = xyz_rf_new_right(end,:);

X_0_idx = find(beam_measured_output(:,1)~=-9999);
X_0 = beam_measured_output(X_0_idx(1),:);
motion_in_depth = 1;
delta_u = Jpinv * ( X_des(1,:) - X_0)';
