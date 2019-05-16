function [z_new_left, z_new_right] = symmetric_pos_ctrl(current_distance, desired_distance, delta_z, T, direction, z_old_left, z_old_right)


        sign = 1;
        if current_distance > desired_distance
            sign = -1;
        end
        z_new_left = z_old_left + sign*delta_z*T;
        z_new_right = z_old_right + direction*sign*delta_z*T;

end