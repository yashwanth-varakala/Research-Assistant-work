clc;
clear;
close all;




[fname, pathname] = uigetfile('*.dat', 'Select a leapmotion data file');
if (fname == 0)
    return;
end
filePath = [pathname fname];


dataFileID = fopen(filePath);


fileInfo = dir(filePath); % File info
fileSize = fileInfo.bytes; % File size

frameNumber = fileSize/912;


for frameIndex = 1:frameNumber
    % Each loop cycle corresponds to a frame (sent by the leapmotion to the PC)
    
    trackingFrameId = fread(dataFileID, 1, 'int64');
    framerate = fread(dataFileID, 1, 'float');
    
    info_frameId = fread(dataFileID, 1, 'int64');
    info_timestamp = fread(dataFileID, 1, 'int64');
    
    hand_id = fread(dataFileID, 1, 'uint32');
    hand_pinchDistance = fread(dataFileID, 1, 'float');
    hand_grabAngle = fread(dataFileID, 1, 'float');
    hand_pinchStrength = fread(dataFileID, 1, 'float');
    hand_grabStrength = fread(dataFileID, 1, 'float');
    
    hand_arm_prevJoint_x = fread(dataFileID, 1, 'float');
    hand_arm_prevJoint_y = fread(dataFileID, 1, 'float');
    hand_arm_prevJoint_z = fread(dataFileID, 1, 'float');
    
    hand_arm_nextJoint_x = fread(dataFileID, 1, 'float');
    hand_arm_nextJoint_y = fread(dataFileID, 1, 'float');
    hand_arm_nextJoint_z = fread(dataFileID, 1, 'float');
    
    hand_arm_rotation_x = fread(dataFileID, 1, 'float');
    hand_arm_rotation_y = fread(dataFileID, 1, 'float');
    hand_arm_rotation_z = fread(dataFileID, 1, 'float');
    hand_arm_rotation_w = fread(dataFileID, 1, 'float');
    
    hand_palm_position_x = fread(dataFileID, 1, 'float');
    hand_palm_position_y = fread(dataFileID, 1, 'float');
    hand_palm_position_z = fread(dataFileID, 1, 'float');
    
    hand_palm_direction_x = fread(dataFileID, 1, 'float');
    hand_palm_direction_y = fread(dataFileID, 1, 'float');
    hand_palm_direction_z = fread(dataFileID, 1, 'float');
    
    % For each digits (thumb index middle ring pinky)
    for i = 1:5
        
        % For each bones (metacarpal proximal intermediate distal)
        for j = 1:4
            
            % The base of the bone, closer to the heart
            prevJoint_x = fread(dataFileID, 1, 'float');
            prevJoint_y = fread(dataFileID, 1, 'float');
            prevJoint_z = fread(dataFileID, 1, 'float');
            
            % The end of the bone, further from the heart
            nextJoint_x = fread(dataFileID, 1, 'float');
            nextJoint_y = fread(dataFileID, 1, 'float');
            nextJoint_z = fread(dataFileID, 1, 'float');
            
            % Rotation in world space from the forward direction
            rotation_x = fread(dataFileID, 1, 'float');
            rotation_y = fread(dataFileID, 1, 'float');
            rotation_z = fread(dataFileID, 1, 'float');
            rotation_w = fread(dataFileID, 1, 'float');
            
            
            if ((i==1)&& (j==1)) % Thumb and metacarpal %BH= bone head; BB= bone base; BR= bone rotation
              
              Thumb_M_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Thumb_M_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Thumb_M_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==1)&& (j==2)) % Thumb and Proximal
              
              Thumb_P_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Thumb_P_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Thumb_P_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==1)&& (j==3)) % Thumb and Intermediate no intermediate to the Thumb
              
              
              
              
              
              Thumb_I_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Thumb_I_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Thumb_I_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
                         
            end
            
            if ((i==1)&& (j==4)) % Thumb and Distal
              
              Thumb_D_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Thumb_D_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Thumb_D_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==2)&& (j==1)) % Index and metacarpal %BH= bone head; BB= bone base; BR= bone rotation
              
              Index_M_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Index_M_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Index_M_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==2)&& (j==2)) % Index and Proximal
              
              Index_P_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Index_P_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Index_P_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==2)&& (j==3)) % Index and Intermediate
              
              Index_I_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Index_I_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Index_I_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==2)&& (j==4)) % Index and Distal
              
              Index_D_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Index_D_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Index_D_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==3)&& (j==1)) % Middle and metacarpal %BH= bone head; BB= bone base; BR= bone rotation
              
              Middle_M_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Middle_M_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Middle_M_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==3)&& (j==2)) % Middle and Proximal
              
              Middle_P_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Middle_P_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Middle_P_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==3)&& (j==3)) % Middle and Intermediate
              
              Middle_I_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Middle_I_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Middle_I_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==3)&& (j==4)) % Middle and Distal
              
              Middle_D_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Middle_D_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Middle_D_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==4)&& (j==1)) % Ring and metacarpal %BH= bone head; BB= bone base; BR= bone rotation
              
              Ring_M_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Ring_M_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Ring_M_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==4)&& (j==2)) % Ring and Proximal
              
              Ring_P_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Ring_P_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Ring_P_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==4)&& (j==3)) % Ring and Intermediate
              
              Ring_I_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Ring_I_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Ring_I_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==4)&& (j==4)) % Ring and Distal
              
              Ring_D_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Ring_D_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Ring_D_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==5)&& (j==1)) % Pinky and metacarpal %BH= bone head; BB= bone base; BR= bone rotation
              
              Pinky_M_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Pinky_M_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Pinky_M_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==5)&& (j==2)) % Pinky and Proximal
              
              Pinky_P_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Pinky_P_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Pinky_P_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==5)&& (j==3)) % Pinky and Intermediate
              
              Pinky_I_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Pinky_I_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Pinky_I_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
            if ((i==5)&& (j==4)) % Pinky and Distal
              
              Pinky_D_BB(frameIndex,:)= [prevJoint_x prevJoint_y prevJoint_z];
              Pinky_D_BH(frameIndex,:)= [nextJoint_x nextJoint_y nextJoint_z];
              Pinky_D_BR(frameIndex,:)= [rotation_x rotation_y rotation_z];             
            end
            
        end  
        
    end
    
    
    
    % all frame details, 
    frame_details(frameIndex,:)= [trackingFrameId framerate info_frameId info_timestamp]; 
    
    %hand details
    hand_details(frameIndex,:)=[hand_id hand_pinchDistance hand_grabAngle hand_pinchStrength hand_grabStrength];
    
    %Hand prev joint= Wrist
    Wrist(frameIndex,:)= [hand_arm_prevJoint_x hand_arm_prevJoint_y hand_arm_prevJoint_z];
    
    %hand next joint = Eblow
    Elbow(frameIndex,:)= [hand_arm_nextJoint_x hand_arm_nextJoint_y hand_arm_nextJoint_z];
    
    % hand rotations
    hand_arm_rotation(frameIndex,:) = [ hand_arm_rotation_x hand_arm_rotation_y hand_arm_rotation_z hand_arm_rotation_w];
    
    %hand  palm position
    hand_palm_position(frameIndex,:)= [hand_palm_position_x hand_palm_position_y hand_palm_position_z];
    
    %hand palm direction
    hand_palm_direction(frameIndex,:)= [hand_palm_direction_x hand_palm_direction_y hand_palm_direction_z];
    
    if (frameIndex==frameNumber)
      
       %data to the matrices
       frame_details_matrix(:,:)=frame_details
       
       hand_details_matrix(:,:)= hand_details
       
       Wrist_matrix(:,:)= Wrist
       Elbow_matrix(:,:)=Elbow
       
       hand_arm_rotation_matrix(:,:)= hand_arm_rotation
       hand_palm_position_matrix(:,:)= hand_palm_position
       hand_palm_direction_matrix(:,:)= hand_palm_direction
       
       Thumb_M_BB_matrix(:,:)=Thumb_M_BB
       Thumb_M_BH_matrix(:,:)=Thumb_M_BH
       Thumb_M_BR_matrix(:,:)=Thumb_M_BR
       
       Thumb_P_BB_matrix(:,:)=Thumb_P_BB
       Thumb_P_BH_matrix(:,:)=Thumb_P_BH
       Thumb_P_BR_matrix(:,:)=Thumb_P_BR
       
       Thumb_I_BB_matrix(:,:)=Thumb_I_BB
       Thumb_I_BH_matrix(:,:)=Thumb_I_BH
       Thumb_I_BR_matrix(:,:)=Thumb_I_BR
       
       Thumb_D_BB_matrix(:,:)=Thumb_D_BB
       Thumb_D_BH_matrix(:,:)=Thumb_D_BH
       Thumb_D_BR_matrix(:,:)=Thumb_D_BR
       
       Index_M_BB_matrix(:,:)=Index_M_BB
       Index_M_BH_matrix(:,:)=Index_M_BH
       Index_M_BR_matrix(:,:)=Index_M_BR
       
       Index_P_BB_matrix(:,:)=Index_P_BB
       Index_P_BH_matrix(:,:)=Index_P_BH
       Index_P_BR_matrix(:,:)=Index_P_BR
       
       Index_I_BB_matrix(:,:)=Index_I_BB
       Index_I_BH_matrix(:,:)=Index_I_BH
       Index_I_BR_matrix(:,:)=Index_I_BR
       
       Index_D_BB_matrix(:,:)=Index_D_BB
       Index_D_BH_matrix(:,:)=Index_D_BH
       Index_D_BR_matrix(:,:)=Index_D_BR
       
       Middle_M_BB_matrix(:,:)=Middle_M_BB
       Middle_M_BH_matrix(:,:)=Middle_M_BH
       Middle_M_BR_matrix(:,:)=Middle_M_BR
       
       Middle_P_BB_matrix(:,:)=Middle_P_BB
       Middle_P_BH_matrix(:,:)=Middle_P_BH
       Middle_P_BR_matrix(:,:)=Middle_P_BR
       
       Middle_I_BB_matrix(:,:)=Middle_I_BB
       Middle_I_BH_matrix(:,:)=Middle_I_BH
       Middle_I_BR_matrix(:,:)=Middle_I_BR
       
       Middle_D_BB_matrix(:,:)=Middle_D_BB
       Middle_D_BH_matrix(:,:)=Middle_D_BH
       Middle_D_BR_matrix(:,:)=Middle_D_BR
       
       Ring_M_BB_matrix(:,:)=Ring_M_BB
       Ring_M_BH_matrix(:,:)=Ring_M_BH
       Ring_M_BR_matrix(:,:)=Ring_M_BR
       
       Ring_P_BB_matrix(:,:)=Ring_P_BB
       Ring_P_BH_matrix(:,:)=Ring_P_BH
       Ring_P_BR_matrix(:,:)=Ring_P_BR
       
       Ring_I_BB_matrix(:,:)=Ring_I_BB
       Ring_I_BH_matrix(:,:)=Ring_I_BH
       Ring_I_BR_matrix(:,:)=Ring_I_BR
       
       Ring_D_BB_matrix(:,:)=Ring_D_BB
       Ring_D_BH_matrix(:,:)=Ring_D_BH
       Ring_D_BR_matrix(:,:)=Ring_D_BR
       
       Pinky_M_BB_matrix(:,:)=Pinky_M_BB
       Pinky_M_BH_matrix(:,:)=Pinky_M_BH
       Pinky_M_BR_matrix(:,:)=Pinky_M_BR
       
       Pinky_P_BB_matrix(:,:)=Pinky_P_BB
       Pinky_P_BH_matrix(:,:)=Pinky_P_BH
       Pinky_P_BR_matrix(:,:)=Pinky_P_BR
       
       Pinky_I_BB_matrix(:,:)=Pinky_I_BB
       Pinky_I_BH_matrix(:,:)=Pinky_I_BH
       Pinky_I_BR_matrix(:,:)=Pinky_I_BR
       
       Pinky_D_BB_matrix(:,:)=Pinky_D_BB
       Pinky_D_BH_matrix(:,:)=Pinky_D_BH
       Pinky_D_BR_matrix(:,:)=Pinky_D_BR
       
       
      %headers of the excel sheet in a sequence
      
      header_hand = {'trackingFrameId','framerate','info_frameId','info_timestamp','hand_id','hand_pinchDistance','hand_grabAngle','hand_pinchStrength','hand_grabStrength','Wrist_x','Wrist_y','Wrist_z','Elbow_x','Elbow_y','Elbow_z','hand_arm_rotation_x','hand_arm_rotation_y','hand_arm_rotation_z','hand_arm_rotation_w','hand_palm_position_x','hand_palm_position_y','hand_palm_position_z','hand_palm_direction_x','hand_palm_direction_y','hand_palm_direction_z'}
      
      header_thumb={'Thumb_M_BBx','Thumb_M_BBy','Thumb_M_BBz','Thumb_M_BHx','Thumb_M_BHy','Thumb_M_BHz','Thumb_M_B_Dir_x','Thumb_M_B_Dir_y','Thumb_M_B_Dir_z','Thumb_P_BBx','Thumb_P_BBy','Thumb_P_BBz','Thumb_P_BHx','Thumb_P_BHy','Thumb_P_BHz','Thumb_P_B_Dir_x','Thumb_P_B_Dir_y','Thumb_P_B_Dir_z','Thumb_I_BBx','Thumb_I_BBy','Thumb_I_BBz','Thumb_I_BHx','Thumb_I_BHy','Thumb_I_BHz','Thumb_I_B_Dir_x','Thumb_I_B_Dir_y','Thumb_I_B_Dir_z','Thumb_D_BBx','Thumb_D_BBy','Thumb_D_BBz','Thumb_D_BHx','Thumb_D_BHy','Thumb_D_BHz','Thumb_D_B_Dir_x','Thumb_D_B_Dir_y','Thumb_D_B_Dir_z'}
      header_index={'Index_M_BBx','Index_M_BBy','Index_M_BBz','Index_M_BHx','Index_M_BHy','Index_M_BHz','Index_M_B_Dir_x','Index_M_B_Dir_y','Index_M_B_Dir_z','Index_P_BBx','Index_P_BBy','Index_P_BBz','Index_P_BHx','Index_P_BHy','Index_P_BHz','Index_P_B_Dir_x','Index_P_B_Dir_y','Index_P_B_Dir_z','Index_I_BBx','Index_I_BBy','Index_I_BBz','Index_I_BHx','Index_I_BHy','Index_I_BHz','Index_I_B_Dir_x','Index_I_B_Dir_y','Index_I_B_Dir_z','Index_D_BBx','Index_D_BBy','Index_D_BBz','Index_D_BHx','Index_D_BHy','Index_D_BHz','Index_D_B_Dir_x','Index_D_B_Dir_y','Index_D_B_Dir_z'}
      header_middle={'Middle_M_BBx','Middle_M_BBy','Middle_M_BBz','Middle_M_BHx','Middle_M_BHy','Middle_M_BHz','Middle_M_B_Dir_x','Middle_M_B_Dir_y','Middle_M_B_Dir_z','Middle_P_BBx','Middle_P_BBy','Middle_P_BBz','Middle_P_BHx','Middle_P_BHy','Middle_P_BHz','Middle_P_B_Dir_x','Middle_P_B_Dir_y','Middle_P_B_Dir_z','Middle_I_BBx','Middle_I_BBy','Middle_I_BBz','Middle_I_BHx','Middle_I_BHy','Middle_I_BHz','Middle_I_B_Dir_x','Middle_I_B_Dir_y','Middle_I_B_Dir_z','Middle_D_BBx','Middle_D_BBy','Middle_D_BBz','Middle_D_BHx','Middle_D_BHy','Middle_D_BHz','Middle_D_B_Dir_x','Middle_D_B_Dir_y','Middle_D_B_Dir_z'}
      header_ring= {'Ring_M_BBx','Ring_M_BBy','Ring_M_BBz','Ring_M_BHx','Ring_M_BHy','Ring_M_BHz','Ring_M_B_Dir_x','Ring_M_B_Dir_y','Ring_M_B_Dir_z','Ring_P_BBx','Ring_P_BBy','Ring_P_BBz','Ring_P_BHx','Ring_P_BHy','Ring_P_BHz','Ring_P_B_Dir_x','Ring_P_B_Dir_y','Ring_P_B_Dir_z','Ring_I_BBx','Ring_I_BBy','Ring_I_BBz','Ring_I_BHx','Ring_I_BHy','Ring_I_BHz','Ring_I_B_Dir_x','Ring_I_B_Dir_y','Ring_I_B_Dir_z','Ring_D_BBx','Ring_D_BBy','Ring_D_BBz','Ring_D_BHx','Ring_D_BHy','Ring_D_BHz','Ring_D_B_Dir_x','Ring_D_B_Dir_y','Ring_D_B_Dir_z'}
      header_pinky= {'Pinky_M_BBx','Pinky_M_BBy','Pinky_M_BBz','Pinky_M_BHx','Pinky_M_BHy','Pinky_M_BHz','Pinky_M_B_Dir_x','Pinky_M_B_Dir_y','Pinky_M_B_Dir_z','Pinky_P_BBx','Pinky_P_BBy','Pinky_P_BBz','Pinky_P_BHx','Pinky_P_BHy','Pinky_P_BHz','Pinky_P_B_Dir_x','Pinky_P_B_Dir_y','Pinky_P_B_Dir_z','Pinky_I_BBx','Pinky_I_BBy','Pinky_I_BBz','Pinky_I_BHx','Pinky_I_BHy','Pinky_I_BHz','Pinky_I_B_Dir_x','Pinky_I_B_Dir_y','Pinky_I_B_Dir_z','Pinky_D_BBx','Pinky_D_BBy','Pinky_D_BBz','Pinky_D_BHx','Pinky_D_BHy','Pinky_D_BHz','Pinky_D_B_Dir_x','Pinky_D_B_Dir_y','Pinky_D_B_Dir_z'}     
          
       %writing to excel sheet  
            
       xlswrite('Data2Excel_submit_1.xlsx',header_hand,'Sheet1','A1');         
       xlswrite('Data2Excel_submit_1.xlsx',header_thumb,'Sheet1','Z1');
       xlswrite('Data2Excel_submit_1.xlsx',header_index,'Sheet1','BJ1');
       xlswrite('Data2Excel_submit_1.xlsx',header_middle,'Sheet1','CT1');
       xlswrite('Data2Excel_submit_1.xlsx',header_ring,'Sheet1','ED1');
       xlswrite('Data2Excel_submit_1.xlsx',header_pinky,'Sheet1','FN1');
       
       
       xlswrite('Data2Excel_submit_1.xlsx',frame_details_matrix(:,:),'Sheet1','A2'); 
       xlswrite('Data2Excel_submit_1.xlsx',hand_details_matrix(:,:),'Sheet1','E2'); 
       xlswrite('Data2Excel_submit_1.xlsx',Wrist_matrix(:,:),'Sheet1','J2');
       xlswrite('Data2Excel_submit_1.xlsx',Elbow_matrix(:,:),'Sheet1','M2');
       
       xlswrite('Data2Excel_submit_1.xlsx',hand_arm_rotation_matrix(:,:),'Sheet1','P2');
       xlswrite('Data2Excel_submit_1.xlsx',hand_palm_position_matrix(:,:),'Sheet1','T2');
       xlswrite('Data2Excel_submit_1.xlsx',hand_palm_direction_matrix(:,:),'Sheet1','W2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_M_BB_matrix(:,:),'Sheet1','Z2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_M_BH_matrix(:,:),'Sheet1','AC2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_M_BR_matrix(:,:),'Sheet1','AF2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_P_BB_matrix(:,:),'Sheet1','AI2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_P_BH_matrix(:,:),'Sheet1','AL2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_P_BR_matrix(:,:),'Sheet1','AO2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_I_BB_matrix(:,:),'Sheet1','AR2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_I_BH_matrix(:,:),'Sheet1','AU2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_I_BR_matrix(:,:),'Sheet1','AX2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_D_BB_matrix(:,:),'Sheet1','BA2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_D_BH_matrix(:,:),'Sheet1','BD2');
       xlswrite('Data2Excel_submit_1.xlsx',Thumb_D_BR_matrix(:,:),'Sheet1','BG2');
       
       
       xlswrite('Data2Excel_submit_1.xlsx',Index_M_BB_matrix(:,:),'Sheet1','BJ2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_M_BH_matrix(:,:),'Sheet1','BM2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_M_BR_matrix(:,:),'Sheet1','BP2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Index_P_BB_matrix(:,:),'Sheet1','BS2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_P_BH_matrix(:,:),'Sheet1','BV2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_P_BR_matrix(:,:),'Sheet1','BY2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Index_I_BB_matrix(:,:),'Sheet1','CB2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_I_BH_matrix(:,:),'Sheet1','CE2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_I_BR_matrix(:,:),'Sheet1','CH2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Index_D_BB_matrix(:,:),'Sheet1','CK2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_D_BH_matrix(:,:),'Sheet1','CN2');
       xlswrite('Data2Excel_submit_1.xlsx',Index_D_BR_matrix(:,:),'Sheet1','CQ2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Middle_M_BB_matrix(:,:),'Sheet1','CT2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_M_BH_matrix(:,:),'Sheet1','CW2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_M_BR_matrix(:,:),'Sheet1','CZ2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Middle_P_BB_matrix(:,:),'Sheet1','DC2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_P_BH_matrix(:,:),'Sheet1','DF2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_P_BR_matrix(:,:),'Sheet1','DI2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Middle_I_BB_matrix(:,:),'Sheet1','DL2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_I_BH_matrix(:,:),'Sheet1','DO2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_I_BR_matrix(:,:),'Sheet1','DR2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Middle_D_BB_matrix(:,:),'Sheet1','DU2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_D_BH_matrix(:,:),'Sheet1','DX2');
       xlswrite('Data2Excel_submit_1.xlsx',Middle_D_BR_matrix(:,:),'Sheet1','EA2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Ring_M_BB_matrix(:,:),'Sheet1','ED2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_M_BH_matrix(:,:),'Sheet1','EG2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_M_BR_matrix(:,:),'Sheet1','EJ2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Ring_P_BB_matrix(:,:),'Sheet1','EM2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_P_BH_matrix(:,:),'Sheet1','EP2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_P_BR_matrix(:,:),'Sheet1','ES2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Ring_I_BB_matrix(:,:),'Sheet1','EV2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_I_BH_matrix(:,:),'Sheet1','EY2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_I_BR_matrix(:,:),'Sheet1','FB2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Ring_D_BB_matrix(:,:),'Sheet1','FE2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_D_BH_matrix(:,:),'Sheet1','FH2');
       xlswrite('Data2Excel_submit_1.xlsx',Ring_D_BR_matrix(:,:),'Sheet1','FK2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_M_BB_matrix(:,:),'Sheet1','FN2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_M_BH_matrix(:,:),'Sheet1','FQ2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_M_BR_matrix(:,:),'Sheet1','FT2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_P_BB_matrix(:,:),'Sheet1','FW2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_P_BH_matrix(:,:),'Sheet1','FZ2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_P_BR_matrix(:,:),'Sheet1','GC2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_I_BB_matrix(:,:),'Sheet1','GF2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_I_BH_matrix(:,:),'Sheet1','GI2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_I_BR_matrix(:,:),'Sheet1','GL2');
       
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_D_BB_matrix(:,:),'Sheet1','GO2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_D_BH_matrix(:,:),'Sheet1','GR2');
       xlswrite('Data2Excel_submit_1.xlsx',Pinky_D_BR_matrix(:,:),'Sheet1','GU2');
       
      end
    end
    


fclose(dataFileID);