function tasa (incr)
color=1/256*[229,85,79;255,209,0;89,203,232];

   k=1:length(incr)-2;
   figure,
   stem(k,incr(2:end-1)./incr(1:end-2).^3,'Color',color(3,:),'MarkerSize',10,'LineWidth',5,'MarkerFaceColor',color(3,:))
   hold on
   stem(k,incr(2:end-1)./incr(1:end-2).^2,'Color',color(2,:),'MarkerSize',10,'LineWidth',5,'MarkerFaceColor',color(2,:))
   stem(k,incr(2:end-1)./incr(1:end-2),'Color',color(1,:),'MarkerSize',10,'LineWidth',5,'MarkerFaceColor',color(1,:))
   legend('p=3','p=2','p=1')
   xlabel('k'), grid
   ylabel('|e_{k+1}|/|e_k|^p')
   axis([k(1) k(end) 0 4])
end