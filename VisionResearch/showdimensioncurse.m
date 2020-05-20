kd=[2:24];
nn = [0.25 0.5 0.75 0.99];

figure(31);  
subplot(2,2,1); hold on; grid on; plot(kd, (1-nn(1)).^kd, '.-k'); ylabel('vol'); xlabel('kd'); legend('\epsilon = 0.25'); 
subplot(2,2,2); hold on; grid on; plot(kd, (1-nn(2)).^kd, '.-b'); ylabel('vol'); xlabel('kd'); legend('\epsilon = 0.5'); 
subplot(2,2,3); hold on; grid on; plot(kd, (1-nn(3)).^kd, '.-k'); ylabel('vol'); xlabel('kd'); legend('\epsilon = 0.75'); 
subplot(2,2,4); hold on; grid on; plot(kd, (1-nn(4)).^kd, '.-b'); ylabel('vol'); xlabel('kd'); legend('\epsilon = 0.99'); 

return;