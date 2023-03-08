function [vert,horz,result] = lab3edge_alternate(logimg,thr,negthr,result_thr)
    sizes = size(logimg);
    vert = uint8(zeros(sizes(1),sizes(2)));
    horz = uint8(zeros(sizes(1),sizes(2)));
    
    pulse_seen = false;
    second_position_not_taken = true;
    for i = 1:sizes(1)
        for j = 1:sizes(2)

            if ~ pulse_seen
                if (logimg(i,j) > thr) 
                    temp_j = j;
                    positive_pulse_first = true;
                    pulse_seen = true;
                elseif (logimg(i,j) < negthr)
                    temp_j = j;
                    positive_pulse_first = false;
                    pulse_seen = true;
                end  
            else
                if positive_pulse_first
                    if (logimg(i,j) > thr)
                        temp_j = j;
                    elseif (logimg(i,j) < negthr) | second_position_not_taken
                        temp_j2 = j;
                        second_position_not_taken = false;
                    elseif ~(logimg(i,j) < negthr)
                        for j2 = temp_j:temp_j2
                            horz(i,j2) = 255;
                        end
                        second_position_not_taken = true;
                        pulse_seen = false;
                    end

                else
                    if (logimg(i,j) < negthr) 
                        temp_j = j;
                    elseif (logimg(i,j) > thr) | second_position_not_taken
                        temp_j2 = j;
                        second_position_not_taken = false;
                    elseif ~(logimg(i,j) > thr)
                        for j2 = temp_j:temp_j2
                            horz(i,j2) = 255;
                        end
                        second_position_not_taken = true;
                        pulse_seen = false;
                    end
                end
            end            
        end
    end
    for i = 1:sizes(2)
        for j = 1:sizes(1)

            if ~ pulse_seen
                if (logimg(j,i) > thr) 
                    temp_j = j;
                    positive_pulse_first = true;
                    pulse_seen = true;
                elseif (logimg(j,i) < negthr)
                    temp_j = j;
                    positive_pulse_first = false;
                    pulse_seen = true;
                end  
            else
                if positive_pulse_first
                    if (logimg(j,i) > thr)
                        temp_j = j;
                    elseif (logimg(j,i) < negthr) | second_position_not_taken
                        temp_j2 = j;
                        second_position_not_taken = false;
                    elseif ~(logimg(j,i) < negthr)
                        for j2 = temp_j:temp_j2
                            vert(j2,i) = 255;
                        end
                        second_position_not_taken = true;
                        pulse_seen = false;
                    end

                else
                    if (logimg(j,i) < negthr) 
                        temp_j = j;
                    elseif (logimg(j,i) > thr) | second_position_not_taken
                        temp_j2 = j;
                        second_position_not_taken = false;
                    elseif ~(logimg(j,i) > thr)
                        for j2 = temp_j:temp_j2
                            vert(j2,i) = 255;
                        end
                        second_position_not_taken = true;
                        pulse_seen = false;
                    end
                end
            end      
        end
    end
    result = vert + horz;
end