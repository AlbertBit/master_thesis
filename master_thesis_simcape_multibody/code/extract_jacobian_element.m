function j_el = extract_jacobian_element(out_var, in_var)

    % extract input indexes 
    in_var_idx_p = find(in_var(:,1)~=-9999);
    in_var_idx_m = find(in_var(:,2)~=-9999);
    
    % extract input variables
    in_var_filt_p = in_var(in_var_idx_p(1):in_var_idx_p(end),1);
    in_var_filt_m = in_var(in_var_idx_m(1):in_var_idx_m(end),2);  
        
    out_in_start_p = out_var(in_var_idx_p(1),:);
    out_in_end_p = out_var(in_var_idx_p(end),:);
    out_in_start_m = out_var(in_var_idx_m(1),:);
    out_in_end_m = out_var(in_var_idx_m(end),:);
    
    j_el_p = (out_in_end_p-out_in_start_p)/(in_var_filt_p(end)-in_var_filt_p(1));
    j_el_m = (out_in_end_m-out_in_start_m)/(in_var_filt_m(end)-in_var_filt_m(1));
    
    j_el = (j_el_p+j_el_m)/2;
        
    j_el = j_el';
    
end